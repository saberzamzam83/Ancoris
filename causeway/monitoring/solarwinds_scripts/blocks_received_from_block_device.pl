#!/usr/bin/perl
@sa=split("\n",`vmstat`);
@line=split(" ",$sa[1]);
for ($i=0; $i <= @line; $i++) {
        if ( $line[$i] eq "bi" ) {
                $j=$i;
                @stat=split(" ",$sa[2]);
                print "Message: Blocks received from block device in blocks/sec: $stat[$j]\n";
                print "Statistic: $stat[$j]\n";
                exit 0;
                }
        }
print "Message: ERROR: Can't find blocks received from block device (bi) in output of -vmstat- command. \n";
exit 1;
