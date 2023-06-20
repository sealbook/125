net use S: \\192.168.10.163\cloud
robocopy D:\ S:\sup4 /R:0 /W:0 /E /PURGE /TEE /NJH /NFL /NDL /XO /MT:100 /LOG+:S:\log\sup4_%date:~0,4%%date:~5,2%%date:~8,2%.log
robocopy C:\Users S:\sup4 /R:0 /W:0 /E /PURGE /TEE /NJH /NFL /NDL /XO /MT:100 /LOG+:S:\log\sup41_%date:~0,4%%date:~5,2%%date:~8,2%.log
net use S: /delete