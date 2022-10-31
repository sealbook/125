#!/bin/bash

count=0
fix='/net/nfs/road_defects/backup/'
dest='/net/nfs/road_defects/backup/tmp/'
#dest='/mnt/vol1/sup/1\ 道路巡查/照片標記資料收集/照片蒐集/tn_D40_all/'

	while read line 
	do
		 count=$((count+1))
		 echo "Line $count:$line"
		 source="$fix/$line"
		 cp "$source" "$dest"
#		 rsync -avh $line $fix
	done < D40_01.txt  ## from while ~ < test.txt # input data

echo "finished"
echo "Line numbers is $count"
exit 0
## 注意 txt文字檔是否有其他字元
## sftp 上傳txt，多出意外字元 < '$'\r'>，僅在cp 失敗後看見
## 解決方法，直接 terminal copy & paste，可行