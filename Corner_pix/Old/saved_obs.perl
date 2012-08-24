#!/usr/bin/perl 

#
#--- this is a supplemental script for ACIS Corner Pixel computation (see /data/mta_www/mta_acis_sci_run/Corner_pix).
#--- this script is not used any more    (Sep 20, 2011)
#

$web_dir = " /data/mta_www/mta_acis_sci_run/Corner_pix/Save/";

$input = `ls -lrt $web_dir/*.gif`;
@list  = split(/\n/, $input);

@obsid_list = ();
$cnt        = 0;

foreach $ent (@list){
	@atemp  = split(/acisf/, $ent);
	$name = 'acisf'."$atemp[1]";
	push(@obsid_list, $name);
	$cnt++;
}
	

open(OUT, "> $web_dir/interesint_obs.html");


print OUT "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"> \n";
print OUT " \n";
print OUT "<html> \n";
print OUT "<head> \n";
print OUT "        <link rel=\"stylesheet\" type=\"text/css\" href=\"http://asc.harvard.edu/mta/REPORTS/Template/mta.css\" /> \n";
print OUT "        <title> ACIS Corner Pixels -- Interesting Observations </title> \n";
print OUT " \n";
print OUT "        <script language=\"JavaScript\"> \n";
print OUT "                function WindowOpener(imgname) { \n";
print OUT "                        msgWindow = open(\"\",\"displayname\",\"toolbar=no,directories=no,menubar=no,location=no,scrollbars=no,status=no,width=700,height=560,resize=no\"); \n";
print OUT "                        msgWindow.document.clear(); \n";
print OUT "                        msgWindow.document.write(\"<html><title>ACIS Corner Pixels:   \"+imgname+\"</title>\"); \n";
print OUT "                        msgWindow.document.write(\"<body bgcolor='black'>\"); \n";
print OUT "                        msgWindow.document.write(\"<img src='./\"+imgname+\"' border =0 ><p></p></body></html>\") \n";
print OUT "                        msgWindow.document.close(); \n";
print OUT "                        msgWindow.focus(); \n";
print OUT "                } \n";
print OUT "        </script> \n";
print OUT " \n";
print OUT "</head> \n";
print OUT "<body> \n";
print OUT "<h2>ACIS Corner Pixels: Interesting Observations </h2> \n";
print OUT "<p>Click to see a plot.</p> \n";
print OUT "<table border=2 cellpadding=10, cellspacing=10> \n";

$ncnt = 0;
foreach $name (@obsid_list){
	if($ncnt == 0){
		print OUT "<tr> \n";
	}

	print OUT "<td align=\"center\"><a href=\"javascript:WindowOpener('$name')\">$name</a></td> \n";
	$ncnt++;

	if($ncnt == 5){
		print OUT "</tr> \n";
		$ncnt = 0;
	}

}

if($ncnt != 0 && $ncnt < 5){
	for($i = $ncnt; $i < 5; $i++){
		print OUT "<td>&#160</td> \n";
	}
	print OUT "</tr> \n";
}


print OUT "</table> \n";
print OUT "<hr /> \n";
print OUT "<p> \n";
print OUT "If you have any questions about this page, please contact \n";
print OUT "<a href=\"mailto:brad\@head.cfa.harvard.edu\">brad\@head.chfa.harvard.edu</a> \n";
print OUT "<br />\n";
$date =`date`;
print OUT "Last Update: $date\n";

print OUT "</p> \n";
print OUT "</body> \n";
print OUT "</html> \n";


close(OUT);




###################################################################################################
###################################################################################################
###################################################################################################

sub convert_to_digit{
	my ($lmon);
	($lmon) = @_;
	chomp $lmon;

	if($lmon =~ /Jan/i){
		$dmon = 1;
	}elsif($lmon =~ /Feb/i){
		$dmon = 2;
	}elsif($lmon =~ /Mar/i){
		$dmon = 3;
	}elsif($lmon =~ /Apr/i){
		$dmon = 4;
	}elsif($lmon =~ /May/i){
		$dmon = 5;
	}elsif($lmon =~ /Jun/i){
		$dmon = 6;
	}elsif($lmon =~ /Jul/i){
		$dmon = 7;
	}elsif($lmon =~ /Aug/i){
		$dmon = 8;
	}elsif($lmon =~ /Sep/i){
		$dmon = 9;
	}elsif($lmon =~ /Oct/i){
		$dmon = 10;
	}elsif($lmon =~ /Nov/i){
		$dmon = 11;
	}elsif($lmon =~ /Dec/i){
		$dmon = 12;
	}

	return($dmon);
}
	
