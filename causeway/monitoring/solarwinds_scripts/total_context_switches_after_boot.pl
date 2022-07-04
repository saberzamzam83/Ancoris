#!/usr/bin/perl
@stat=split(" ",`vmstat -s | grep "CPU context switches"`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: CPU context switches after boot: $stat[0]\n";
        print "Statistic: $stat[0]\n";
        exit 0;
        }
print "Message: ERROR: Can't find CPU context switches in output of (vmstat -s) command. \n";
exit 1;
