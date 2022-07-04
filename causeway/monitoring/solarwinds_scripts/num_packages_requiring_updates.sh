x=` yum check-update | sed -n '/^$/,$p' | sed '/^$/d' | wc -l`
PACKAGES=` yum check-update | sed -n '/^$/,$p' | sed '/^$/d' | paste -s -d, -`
echo "Message:  Packages with updates available - $PACKAGES";
echo "Statistic: $x";
exit 0;
