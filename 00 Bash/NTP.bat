net use \\192.168.10.231 1qaz#EDC /user:bernice
net time \\192.168.10.231 /set /y
net use \\192.168.10.231 /d

##cmd
## w32tm /resync /nowait
##PowerShell
## Start-Process w32tm -ArgumentList "/resync /nowait" -Verb RunAs