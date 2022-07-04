#!/usr/bin/perl
@sa=split("\n",`vmstat`);
@line=split(" ",$sa[1]);
for ($i=0; $i <= @line; $i++) {
        if ( $line[$i] eq "bo" ) {
                $j=$i;
                @stat=split(" ",$sa[2]);
                print "Message: Blocks sent to block device in blocks/sec: $stat[$j]\n";
                print "Statistic: $stat[$j]\n";
                exit 0;
                }
        }
print "Message: ERROR: Can't find blocks sent to block device (bo) in output of -vmstat- command. \n";
exit 1;
