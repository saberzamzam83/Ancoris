#!/usr/bin/perl
@stat=split(" ",`vmstat -s | grep interrupts`);
$exit=`echo $?`;
if ( $exit == 0 ) {
        print "Message: Interrupts after boot: $stat[0]\n";
        print "Statistic: $stat[0]\n";
        exit 0;
        }
print "Message: ERROR: Can't find interrupts in output of (vmstat -s) command. \n";
exit 1;
