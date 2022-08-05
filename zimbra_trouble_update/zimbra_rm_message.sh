#!/bin/bash
# rm_message.sh <FROM>  ## 多帳戶
# sh /opt/zimbra/rm_message.sh 標題字串
if [ -z "$1" ]; then   # $1 null 值為true，執行時要加字串
	echo "usage:  rm_message.sh <FROM>"
	exit 0 # 關閉
else
#addr=( mailtemp1@gmail.com anothermail@yahoo.com thirdmailtemp02@gmail.com )
addr=admin@mail2.infowize.com.tw
subject=$1  ##輸入字串
#echo "Searching mail $addr from Mail:  $subject"
	for victim in "${addr[@]}";
	  do
		echo "=======Looking for "$victim""
		#instead "From:$subject" you can use "subject:$subject" or something another
		for msg in `zmmailbox -z -m "$victim" s -l 500 -t message "From:$subject"|awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$" | awk '{ print $2 }'`
		  do
		echo "Found "$msg""
		#you can comment next line (#) for ONLY check mails, without deleting
		zmmailbox -z -m $victim dm $msg
		done
	done
fi