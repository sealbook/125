#!/bin/bash
# rm_message.sh user@domain.com subject  執行時要加 $1：帳戶 $2：搜索字串<標題>
if [ -z "$2" ]; then ##未加搜索字串則結束shell
	echo "usage:  rm_message.sh user@domain.com <subject>"
	exit 0
else
	addr=$1
	subject=$2
	echo "Searching $addr  for Subject:  $subject"
	for msg in `zmmailbox -z -m "$addr" s -l 999 -t message "subject:$subject"|awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$" | awk '{ print $2 }'`
	  do
		echo "Removing "$msg""
		zmmailbox -z -m $1 dm $msg
	done
fi