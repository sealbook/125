########################
## 連線 SMB share 帳戶未成，重啟 SMB 服務
net stop LanmanWorkstation /y  
net start LanmanWorkstation
########################
/opt/zimbra/libexec/zmfixperms
su - zimbra -c "指令"
chown -R zimbra:zimbra /opt/zimbra/backup
########################
rule 01：<換位思考> 從預期成果 一步步回推達成條件與投入方式，即推演情況roadmap <tree>
rule 02：<甲方情緒> 沒有看前顧後，做事粗手粗腳，容易讓人炸毛
follower：zimbra 9 官方repo，是否可以正常更新後，重啟所有服務
2022.08.03 VMs test upgrade fail
issue101：lab 137 oxoffice 內建 docker nextcloud22 <同一個node> <目標修正>
          oxoffice 應用放棄，update 至2022，未至nextcloud 一起前進
		  ** 轉換至 ucs 內建的 nextcloud 與其他 共筆office 
issue201：G-suite 與現行 mail2切換流程
< 是從 mail2.infowize.com.tw to infowize.com.tw ??> <pchome =domain || 130 DNS hostname >
issue301：同步 or 備份 gmail 信件
#############################
## 轉移 gmail 信件 <theo@infowize.com.tw  to theo@mail2.infowize.com.tw> 
   要求jcwang 開放權限 ?? 可行嗎??
#############################
final labbing for  UCS NEXTcloud plug word online writer ??
issue 201：mail server 設定 ?? < smtp replay to mail2 fail ?? ><內外不同>
issue 301：同步gmail to 132 zimbra <labbing><gsuite two step auth need to open>
<got you back || 權限不夠>
 
web reference for mailserver
https://docs.software-univention.de/manual/5.0/en/mail/index.html
https://sourceforge.net/p/univentioncorporateserver/blog/2018/08/briefly--set-up-a-ucs-mail-server-as-a-central-it-service/

ldapsearch -x -H ldap://192.168.10.231 -b "cn=groups,dc=infowize,dc=intra" -D "cn=Administrator,cn=users,dc=infowize,dc=intra" -w ITewsn1234 "uid=theo"

◇  project 01 back to front
	step 1 幫kiki 多用一台pc by w10 pro <可以加網域 for 163|103> <mstsc>
	<sup3,theo,elaine,bernice,kiki done || jackson yet><win10 home 用更新升級免重灌>
	step 2 確認沒有在跑 GPU <by NFS>，但因change ACL <不要同時執行><更改103 NAS設定>
	◆ step 3 jackson change profile 適應問題 8/8 kiki deploy A W10 VMs尚未聽到使用心得

◇ project 02 timing timing change
	step 1 同步gmail <權限沒開>
	step 2 zimbra 改domain <mail2.infowize.com.tw> to <infowize.com.tw>
	<流程測試??> <功能是rename or add 2nd domain>

◇ project 03 <zimbra9 OSE> rename domain mail2.infowize.com.tw to infowize.com.tw
目前分二階段，一是改 domain name by cil，二是改hostname </etc/hosts /etc/hostname dns>
	◇ subgoal 01 ：改完 servername後，能正常運作且能重啟
	https://wiki.zimbra.com/wiki/ZmSetServerName  成功
	zmprov gacf | grep mail2.infowize.com.tw
	zmprov gs `zmhostname` | grep mail2.infowize.com.tw
	zmlocalconfig | grep mail2.infowize.com.tw
	仍有些許config 未改，會影響嗎？
	
	◇ subgoal 02 ：改完 domain 後，能正常運作且能重啟
	zmprov -l renamedomain mail2.infowize.com.tw infowize.com.tw
	after rename domain ,reboot host restart zmcontrol function work
	look like enable

◆ 本機備份到 163 nas
1確認執行 robocopy ok
◆ issue 來源，163 權限被改？folder path ？考慮檔案容量？備份內容？
2定時執行 taskschd.msc
 
34 32 33 
idle 時，會有風高低運轉聲


◆ 技術債要還：Ⅲ 自建弱掃功能的軟體…？
9/27 1730 到 桃竹苗分署，先請外出
172.23.1.80
high： SMB share 權限
1：取消 guest access
2：增加 SMB share ACL 控管
3：hosts allow / deny <可連線 ip>
high： SMB 版本升級 ？ <4.13.17, 4.14.12, or 4.15.5>
1：指令 ？
medium： SMB signing not required
1：設定 帳號<NAS本地> AD /LDAP/NIS
medium：ssh 加密等級不夠<使用弱算法>
1：？
medium：nginx 版本升級 < version 1.17.7 ><不是apache？| 都有>
1：指令？or 升級freenas version？
low：ssh weak algorithms enable
1：如何禁用？

172.23.1.81
hight：iscsi all to all
1：重設 iscsi 選項選 一對一
medium：ssh 加密等級不夠<使用弱算法>
medium：nginx 版本升級 < version 1.17.7 >
1：指令？or 升級freenas version？
low：ssh weak algorithms enable<如何禁用？>

1：若在不能升級freenas version下，禁用 ssh，僅用 webUI/web CLI 操作
cat /etc/version
pkg info openssh-portable   <check ssh version>
2：nginx
httpd -v                    <check apache version>
pkg info nginx
pkg search nginx
pkg install nginx

webrefference
https://www.truenas.com/community/threads/how-to-upgrade-ssh-version-on-freenas.21574/
https://www.truenas.com/community/threads/how-to-update-openssh-and-apache-version.93269/
https://www.cyberciti.biz/faq/how-to-install-and-upgrade-openssh-server-on-freebsd/
firewall 設定二點<ip>對連
https://blog.miniasp.com/post/2009/09/15/Which-ports-should-open-for-UNC-SMB-CIFS-connection
SMB被弱點掃描判定為重大危機
https://ithelp.ithome.com.tw/questions/10185969
