cat /var/log/maillog |grep reject | awk {'print $3'} | awk -F: {'print $1":"$2,"Rejected"'} | uniq -c
cat /var/log/maillog |grep Delivered | awk {'print $3'} | awk -F: {'print $1":"$2" Delivered"'} | uniq -c
