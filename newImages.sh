#/bin/bash
#set -xv
list=`docker ps -a | awk '{print $2}' | cut -d':' -f 1 | tail -n +2`

echo > result.log

for item in $list
do
        echo "Item: $item"
	docker pull $item
	hubVersion=`docker images -q --no-trunc $item:latest`
	usedVersion=`docker inspect --format='{{.Image}}' $item`
	echo $hubVersion
	echo $usedVersion
	if [ $hubVersion = $usedVersion ]
	then
        	echo "$item pas de nouvelle version"
	else
        	echo "$item nouvelle version" >> result.log
	fi
done

