#!/bin/bash
# batch move file to error_match/20210809/

source_1=/road/road_defects/web/20210809/bfmarking/$file_name
source_2=/road/road_defects/web/20210809/originals/$file_name
source_3=/road/road_defects/web/20210809/previews/$file_name
dest_1=/road/road_defects/web/error_match/20210809/bfmarking
dest_2=/road/road_defects/web/error_match/20210809/originals
dest_3=/road/road_defects/web/error_match/20210809/previews


   data=$(head -n $count $file | tail -n 1)
   
   source_file=/var/https/source/$data
   dest_dir=/var/https/process/

   count=$(($count+1))

   #file_exists=0
#   test -f "$source_file" && file_exists=1
   
if [ "$file_exists" = 1 ]
   then
      process_count=$(($process_count+1))
      echo "$count.$data"
      mv $source_file $dest_dir
   else
      echo "not found";
   fi
   
   mv source_1 dest_1
   mv source_2 dest_2
   mv source_3 dest_3
   
#!/bin/bash
count=1
	cat test.txt |
	while read line  ##line 變數
	do
	  echo "Line $count:$line"
	  count=$((count+1))  # 計數+1
	done ## from cat ~ done
echo "finish"
exit 0

#! /bin/bash
count=0
	while read line 
	do
	  count=$((count+1))
	  echo "Line $count:$line"
	done < test.txt  ## from while ~ < test.txt # input data

echo "finished"
echo "Line no is $count"
exit 0