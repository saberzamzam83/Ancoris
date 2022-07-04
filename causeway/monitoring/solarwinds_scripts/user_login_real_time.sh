x=`sudo /usr/sbin/ausearch -if /var/log/audit/audit.log -m USER_LOGIN -sv yes  -ts recent -te now -i | grep -v "^----$" | grep -v "auid=ansible " | grep -v "auid=solarwinds " | grep -v "auid=ansible " | grep -v "auid=qualys"| wc -l`
LOGIN_BY=`sudo /usr/sbin/ausearch -if /var/log/audit/audit.log -m USER_LOGIN -sv yes -ts recent -te now -i | grep -v "^----$" | grep -v "auid=ansible " | grep -v "auid=solarwinds " | grep -v "auid=ansible "| sed -e 's/^.* auid=//' -e 's/ .*$//' | sort | uniq | paste -s -d, -`
echo "Message:  $LOGIN_BY";
echo "Statistic: $x";
exit 0;
