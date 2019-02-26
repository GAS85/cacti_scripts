#!/bin/bash

user="USER"
# Please genereate APP PASSWORD!!!
password="SOMEPASSWORD"
# E.g. https://mynextcloud.com
url="https://mynextcloud.com"

tempfile=/tmp/nextcloud_api_poller_$(date +"%Y-%m-%d").tmp

[ -f "$tempfile" ] && exit

touch $tempfile
touch $tempfile.list
touch $tempfile.output

echo "<num_users>" > $tempfile.list
echo "<num_files>" >> $tempfile.list
echo "<num_storages>" >> $tempfile.list
echo "<num_storages_local>" >> $tempfile.list
echo "<num_storages_home>" >> $tempfile.list
echo "<num_storages_other>" >> $tempfile.list
echo "<num_shares>" >> $tempfile.list
echo "<num_shares_user>" >> $tempfile.list
echo "<num_shares_groups>" >> $tempfile.list
echo "<num_shares_link>" >> $tempfile.list
echo "<num_shares_link_no_password>" >> $tempfile.list
echo "<last5minutes>" >> $tempfile.list
echo "<last1hour>" >> $tempfile.list
echo "<last24hours>" >> $tempfile.list

urlFull="https://$url/ocs/v2.php/apps/serverinfo/api/v1/info"

curl -s -u $user:$password $urlFull > $tempfile

status=$(grep statuscode $tempfile | cut -d ">" -f 2 | cut -d "<" -f 1)

if [ $status == "200" ]; then

	while IFS='' read -r Resource || [[ -n "$Resource" ]]; do

		echo "$Resource:$(grep $Resource $tempfile | cut -d ">" -f 2 | cut -d "<" -f 1)" >> $tempfile.output

	done < $tempfile.list

else

	echo API call error status, code is $status
	rm $tempfile
	rm $tempfile.list
	rm $tempfile.output
	exit 1

fi

cat $tempfile.output | tr '\n' ' ' |  tr -d "<" |  tr -d ">"

rm $tempfile
rm $tempfile.list
rm $tempfile.output

exit 0
