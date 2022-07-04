x=`sudo /usr/sbin/ausearch -if /var/log/audit/audit.log -m USER_LOGIN -sv yes -ts today -te now -i | grep "auid=root " | wc -l `
echo "Message:  Root Login Detected";
echo "Statistic: $x";
exit 0;
