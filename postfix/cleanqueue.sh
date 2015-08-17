for i in `mailq |grep string_to_clean| awk {'print $1'} | cut -c -14`; do echo $i; find /var/spool/mqueue/ |grep $i | xargs rm -f; done
