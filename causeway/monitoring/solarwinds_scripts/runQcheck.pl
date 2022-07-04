#!/usr/bin/perl
@sa=split("\n",`vmstat`);
@line=split(" ",$sa[1]);
for ($i=0; $i <= @line; $i++) {
        if ( $line[$i] eq "r" ) {
                $j=$i;
                @stat=split(" ",$sa[2]);
                print "Message: Run queue: $stat[$j]\n";
                print "Statistic: $stat[$j]\n";
                exit 0;
                }
        }
print "Message: ERROR: Can't find run queue (r) in output of -vmstat- command. \n";
exit 1;

