# Get the Date of the last update (will be YYYY-MM-DD, eg. 2019-10-26)
LAST_UPDATE=`sudo yum history | grep Update | awk -F'|' ' { print $3 } ' | sed -re 's/^.*([0-9]{4}-[0-9]{2}-[0-9]{2}).*$/\1/' | head -1`

# Small chance that there's never been an update. If so, set a LAST_UPDATE of 999 days ago (so Solarwinds can trigger serious alert)
case $LAST_UPDATE in
'') LAST_UPDATE=`date -d 'now - 999 days' +'%Y-%m-%d'` ;;
esac

# Work out number of days between today and the last update
# The %s provides the number of seconds since 01 Jan 1970 (Unix time). This makes the math simple when calculating difference
TDAY=$(date +'%s')
LAST=$(date -d "$LAST_UPDATE" +%s)

# Get the number of seconds between now and the last update. Divide by the number of seconds in a day (86,4000) to give days
DAYS=$(( (TDAY - LAST) / 86400 ))

echo "Message:  Last yum update was ${LAST_UPDATE} ($DAYS days ago)";
echo "Statistic: $DAYS";
exit 0;

