# !/bin/ bash
# 
 echo  " ......begin backup databases...... " 
 echo  " current time = " $(date "+%Y%m%d")
   #docker exec -it ost_db mysqldump -uroot -psecret osticket> ~/mysql/$(date '+%Y%m%d')bak.sql
   docker exec -i ost_db mysqldump -uroot -psecret osticket> /nfs4vm/osticket_db/$(date '+%Y%m%d')bak.sql
 echo  " backup databases ost_db end !!! "
