@echo off

net use S: \\192.168.10.163\cloud
robocopy D:\ S:\bernice /R:0 /W:0 /E /PURGE /TEE /NJH /NFL /NDL /XO /MT:100 /LOG+:S:\log\bernice_%date:~0,4%%date:~5,2%%date:~8,2%.log
net use S: /delete

#@echo "請確認log file是否有錯誤"
#pause
#
#==========================================
#copy 以上
#/e ：代表複製子資料夾，含空的資料夾
#/xo ：排除較舊的檔案，意思是來源端沒有比目的端新時，就不複製(差異化備份)
#/purge ：刪除來源中，不再存在的資料夾或檔案(這個也是差異化備份)
