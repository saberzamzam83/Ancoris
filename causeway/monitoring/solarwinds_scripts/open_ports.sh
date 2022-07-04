PORTS=`sudo /usr/bin/firewall-cmd --list-all | grep -E "^  ports:" | sed 's/^  ports://'`
SERVICES=`sudo /usr/bin/firewall-cmd --list-all | grep -E "^  services:" | sed 's/^  services://'`

x=0

case $PORTS in
*any*) x=1;;
esac

case $SERVICES in
*any*) x=1;;
esac

echo "Message:  Open ports are $PORTS $SERVICES";
echo "Statistic: $x";
exit 0;
