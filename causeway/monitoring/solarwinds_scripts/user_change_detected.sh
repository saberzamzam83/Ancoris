x=`sudo /usr/sbin/ausearch -if /var/log/audit/audit.log -m ADD_USER,DEL_USER,USER_CHAUTHTOK,ADD_GROUP,DEL_GROUP,CHGRP_ID,ROLE_ASSIGN,ROLE_REMOVE  -ts today -te now -i | grep -v "^----$" | grep -v "auid=ansible " | grep -v "auid=solarwinds " | wc -l`
activity=`sudo /usr/sbin/ausearch -if /var/log/audit/audit.log -m ADD_USER,DEL_USER,USER_CHAUTHTOK,ADD_GROUP,DEL_GROUP,CHGRP_ID,ROLE_ASSIGN,ROLE_REMOVE  -ts today -te now -i | grep -v "^----$" | grep -v "auid=ansible " | grep -v "auid=solarwinds " | sed -e 's/^.*auid=//' -e 's/ .*msg=.op=/ did /' -e 's/ exe=.*$//' | paste -sd,`
echo "Message:  User Change Detected - $activity";
echo "Statistic: $x";
exit 0;
