#!/usr/bin/perl
@stat=split(" ",`cat /proc/meminfo | grep AnonPages`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: Anonymous pages in kB: $stat[1]\n";
        print "Statistic: $stat[1]\n";
        exit 0;
        }
print "Message: ERROR: Can't find anonymous pages field (AnonPages) in (/proc/meminfo) file. \n";
exit 1;
