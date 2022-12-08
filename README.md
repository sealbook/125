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


#################################
中文教程過多不協和音，看不清架構/流程，確認domainname 錯字<easy to lab >
## NIS deploy server slave & client
https://yungyuc.github.io/oldtech/debian/NISConf.html
http://bioinfo.cs.ccu.edu.tw/wiki/doku.php?id=nis
https://sc8log.blogspot.com/2017/05/nis-server-masterslave.html
https://it001.pixnet.net/blog/post/324192967-it%E4%BA%8B%E4%BB%B6%E7%B0%BF-%E5%BB%BA%E5%80%8Bnis%E6%9C%8D%E5%8B%99%E5%90%A7
https://shazi.info/nis-%E5%AE%89%E8%A3%9D%E7%AD%86%E8%A8%98/
https://www.weithenn.org/2009/07/nis.html
https://junyonglee.me/ubuntu/nis/setting-up-NIS-for-ubuntu/#setting-up-master-server
## noise   ## spell error
https://blog.csdn.net/u014173215/article/details/108413357
https://linuxhint.com/install_nis_server_ubuntu/
https://www.server-world.info/en/note?os=Ubuntu_22.04&p=nis&f=1
http://www2.yukawa.kyoto-u.ac.jp/~koudai.sugimoto/dokuwiki/doku.php?id=%E8%87%AA%E4%BD%9C%E3%82%AF%E3%83%A9%E3%82%B9%E3%82%BF%E8%A8%88%E7%AE%97%E6%A9%9F:nis%E3%81%AE%E5%9F%BA%E6%9C%AC%E8%A8%AD%E5%AE%9A
https://www.server-world.info/en/note?os=Ubuntu_22.04&p=nis&f=1
https://www.server-world.info/en/note?os=Ubuntu_22.04&p=nis&f=2
https://www.server-world.info/en/note?os=Ubuntu_22.04&p=nis&f=3
https://junyonglee.me/ubuntu/nis/setting-up-NIS-for-ubuntu/#setting-up-client
https://linuxhint.com/install_nis_server_ubuntu/
https://junyonglee.me/ubuntu/nis/setting-up-NIS-for-ubuntu/#setting-up-slave-server
理論架構
https://docstore.mik.ua/orelly/networking_2ndEd/nfs/ch03_02.htm
http://bioinfo.cs.ccu.edu.tw/wiki/doku.php?id=nis
https://yungyuc.github.io/oldtech/debian/NISConf.html
https://linux.vbird.org/linux_server/centos6/0430nis.php
#################################
https://github.com/novnc/noVNC
https://newtoypia.blogspot.com/2018/11/novnc.html
#################################
>>>>>>> parent of cd47d83c (2022.11.17 #1)
email
trzhc2-noreply@himax.com.tw
10.240.230.50
25

nis
hxhc
10.240.134.147,10.240.134.148,10.240.134.132
ssh/nfs/snmp/smart


