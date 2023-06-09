#!/bin/sh
if [ $# -lt 2 ]
 then
	 echo "Wrong parameters"
	 echo "usage:./speed-t.sh source_path destination_path"
	 echo "ex. ./speed-t.sh /root /mnt/nas"
	 exit 0
fi
sour=$1
dest=$2
log=log_$sour_to_$dest_`date +%m%d%H%S%M`.txt
touch /root/$log

END=3
for i in $(seq 1 $END);
do

echo "TAR from $sour to $dest"
if [ -e $dest/huge.tar ]
then
	rm -f $dest/huge.tar
fi
echo "---$i tar from $sour to $dest" >>/root/$log
{ ( cd $sour ; time tar cf - huge.tar) | (cd $dest ; tar xf - ) ; } 2>>/root/$log

echo "DD from $sour to $dest/huge$i.tar"
if [ -e $dest/huge.tar ]
then
	rm -f $dest/huge.tar
fi
echo "---$i dd from $sour/huge.tar to $dest/huge.tar" >>/root/$log
{ time dd if=$sour/huge.tar of=$dest/huge.tar bs=1M ; } 2>>/root/$log

echo "CP from $sour/huge.tar to $dest/huge$i.tar"
if [ -e $dest/huge.tar ]
then
	rm -f $dest/huge.tar
fi
echo "---$i cp from $sour/huge.tar to $dest/huge.tar" >>/root/$log
{ time cp $sour/huge.tar $dest/huge.tar ; } 2>>/root/$log
done
