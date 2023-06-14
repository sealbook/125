@echo off

REM Disable SMB1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d 0 /f

REM Enable Function Discovery services
sc config fdPHost start=auto
sc config FDResPub start=auto

REM Clear WINS settings (if applicable)
netsh interface ip set wins "Local Area Connection" dhcp

REM Reboot the system
shutdown /r /t 0