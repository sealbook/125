@echo off

net use S: \\192.168.10.163\cloud
robocopy D:\ S:\bernice\D /R:0 /W:0 /E /PURGE /TEE /NJH /NFL /NDL /XO /XD \$Recycle.Bin\ /XF *.tmp /xa:sh /XD /maxage:7 /MT:100 /LOG+:S:\log\bernice_%date:~0,4%%date:~5,2%%date:~8,2%.log
robocopy C:\ S:\bernice\C /R:0 /W:0 /E /PURGE /TEE /NJH /NFL /NDL /XO /XD \$Recycle.Bin\ /XF *.tmp /xa:sh /XD /maxage:7 /MT:100 /LOG+:S:\log\bernice_%date:~0,4%%date:~5,2%%date:~8,2%.log
net use S: /delete

#@echo "請確認log file是否有錯誤"
#pause
#
#==========================================
#copy 以上
#/e： 代表複製子資料夾，含空的資料夾
#/xo：排除較舊的檔案，意思是來源端沒有比目的端新時，就不複製(差異化備份)
#/purge：刪除來源中，不再存在的資料夾或檔案(這個也是差異化備份)
#/R：n 失敗複本的重試次數：預設值是 1 百萬次。   
#/W：n 重試之間等候時間：預設值是 30 秒。 
#/E：  複製子目錄，包括空的子目錄。 
#/TEE：輸出至主控台視窗，以及記錄檔。 
#/NFL：沒有檔案清單 - 不記錄檔案名稱。 
#/NDL：沒有目錄清單 - 不記錄目錄名稱。 
#/XO： 排除較舊的檔案。 
#/PURGE：刪除來源已經不存在的目的地檔案/目錄。 
#/COPYALL：複製所有檔案資訊(相當於 /COPY:DATSOU)。 
#/LOG+:file：輸出狀態至記錄檔 (附加至現有的記錄檔)。 
#/MIR：鏡像樹狀目錄 (相當於 /E 加 /PURGE)。 
#/MT[:n]：以 n個執行緒執行多執行緒複製 (預設值為 8)。 
#         n 必須至少為 1，但不可以大於 128。 
#         此選項與 /IPG 和 /EFSRAW 選項不相容。 
#         使用 /LOG 選項重新導向輸出，以獲得更好的效能。 
#/xa:sh :: 跳過屬性為 s (系統) 與 h (隱藏) 的檔案。因為是複製整個硬碟，預設會連 Windows隱藏的系統檔都複製過去，所以要排除。
https://blog.csdn.net/WuLex/article/details/104665794
https://mitblog.pixnet.net/blog/post/45087852-%5Bdos%5D-robocopy-%E6%95%99%E5%AD%B8
排除 
\System Volume Information\
\$Recycle.Bin\
\RECYCLE?\
\Recovery\
*\thumbs.db
robocopy /? <help>