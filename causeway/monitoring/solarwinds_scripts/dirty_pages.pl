#!/usr/bin/perl
@stat=split(" ",`cat /proc/meminfo | grep Dirty`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: Dirty pages in kB: $stat[1]\n";
        print "Statistic: $stat[1]\n";
        exit 0;
        }
print "Message: ERROR: Can't find dirty pages field (Dirty) in (/proc/meminfo) file. \n";
exit 1;
