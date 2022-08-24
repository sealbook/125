# 125 for sync /122 for backup by github

<2022.04.13>
commit -m pull all /122/*.txt
cat <<dog > tmp.txt

## And sort D:/ISO /Tools 
## Add 66 process_data , but no show changes for commit
## The file is too large for git < 100MB？>
## Only add DIR，it wiil not show the change, must add the file even zero bit

-----------------------------------------
### TN project ref
## docker + road-web + line
https://github.com/partment?tab=repositories
##中央氣象局 地震測報中心 <查看全台每月發生地震震度>
https://scweb.cwb.gov.tw/zh-tw/earthquake/data
#災防告警細胞廣播訊息
https://cbe.tw/announcement/
#查看全台3G+4G 訊號強弱分佈
https://coverage.cht.com.tw/coverage/tw.html
#交通部中央氣象局 各地氣象紀錄 <確認道路情況| 能否正常辨識>
https://www.cwb.gov.tw/V8/C/W/Town/Town.html?TID=6703600
-----------------------------------------

#######################

2022.04.13 
因 GPU 在處理 <tnrcv2.sh> copy FTP upload file 時常出現 error
故 在四月結案前，停止 122 上 crontab <tnrcv2.sh>，只在 GPU 停機時執行
%% 若 GPU 開機狀態，執行<./tnrcv2.sh> 時常出現 error <並非100%>
%% 查看 grep -i error ~/logs/2022_04_XX.log | wc

%% <重新執行> cp /road/road_defects/backup/*2022_04_XX*.jpg /road_defects/recv
%% <不要mv>，因 backup下已經是 raw_data 最後備份，故 GPU 拉去處理後圖檔即消失

#######################
$ea1booK
2022.05.03 new project
pr0ject.01  @ new mail server for free <in 3 month | 2022.07.30 include test online>
project.02  @ D40 辨識率提升by KS from 2021.01.01~2021.12.31
project.03  @ 12XX photo in TN id to D20 or D30
#######################
2022.05.03 
project.02  @已看完並下載數區的D40照片~to be continue
project.01  @lab_test 選項 1.mailcow docker 2.docker-mailserver 3.Zibra <JSJSS>!!？？

#######################
2022.05.04
project.01  @1.Web UI 即可使用，可免安裝 client <like outlook！？>
            @1.1 base on 掃毒<ClamAV> 鎖定mailsvr blockbit data #垃圾信篩選
		    @2.有 日歷功能<安排行程> | 線上 edit 文件 | 連結 nextcloud
		    @3.備份DB | 維護容易 | UI 界面易用  | 中文
		    @2022.05.06 提出簡易項目方向與選擇 <Jackson forgot>
#######################
2022.05.06
project.01  @install Proxmox Mail Gateway <PMG>
            @install Proxmox Backup Server <PBS>
		    @install Zimbra OSE 8.8 on U20 <CLI command => su zimbra>
		     /opt/zimbra/bin/command
		    @dnscache is not running ~~why

#######################
2022.05.09
project.01  @dns 53 衝突？<先刪除dnsservice> 轉port to 443
            @192.168.10.129:443 https://wp.infowize.com.tw 可登入中文WEBUI
		    @初步嘗試連接 nextcloud，try app "zimbradrive"，出現failure，已修復至可登入<刪除app>
		    @更新nextcloud docker<app 24.0.0 /db 10.7> 至最新
		    @明日另建測試連接用的nextcloud 18 for zimbra driver...
########################
2022.05.12  @dealline <5/20>下周五前開會，提出目前可行開源方向與功能可行與不可行的item
            @jackson  提出批評，不主動、懶政，事不關已
            @另一方向，若是時間與技術上不許可，直接買商業版買斷使用
https://www.zimbra.com/downloads/zimbra-collaboration/
#######################
202.05.13   @deadline 4 workday
Fri         @已成功 deploy Zimbra 9 OSE <中文| 不含drver>
			@已成功 deploy Zextras Carbonio <client顯示中文fail，but 7071 可以(auto)|>
				zmprov gcf zimbraMailProxyMaxFails
				zmprov mcf zimbraMailProxyMaxFails 0
			@ 192.168.10.129/carbonio
			@ deploy iredmail 試試與 Zimbra 9 Network 60 day 測試<看功能差別…>
			
#########################
2022.05.13 #2
     @第三季預期主動，將microsvr 1U，替換新拿回的HP 1U
     內容 PVE cluster<?/other>，docker cluster
     ^優化目前NAS實機<容量/數量>
	 @103 目前主要工作內容 NAS，163 舊有資料存放<cold>與SIG <業務live>
	 @122 主要為 docker svr 兼對外服務 <FTP=車機用/客戶用>
	 @70  主要為VMware用=> 車機與AI處理raw與data，以上再互相備份
	 @架構太亂，目標之一，替換NAS使用的HDD 容量從 2T/4T/8T，<是否>可以提升至18T
	 @若可以提升容量，則將資料集中存放，減少data重覆，架構重作<備份方向重新調整>
	 @106 <?>新作土砲NAS，內含18T與data若干<?>
	 @二女提出，網頁要能顯示已提交缺陷的圖示<有記憶><資料要記錄>
#######################
2022.05.19
Thu  @開啟gmail 低安全性，開放第三方產品連線<nextcloud mail 插件>https://support.google.com/accounts/answer/6010255#zippy=%2C%E5%A6%82%E6%9E%9C%E6%82%A8%E7%9A%84%E5%B8%B3%E6%88%B6%E9%96%8B%E5%95%9F%E4%BA%86%E4%BD%8E%E5%AE%89%E5%85%A8%E6%80%A7%E6%87%89%E7%94%A8%E7%A8%8B%E5%BC%8F%E5%AD%98%E5%8F%96%E6%AC%8A
     @Zimbra OSE 要與 nextcloud 連結需額外安裝第三方的應用<zimlet><owncloud-zimlet>
	 @https://github.com/Zimbra-Community/owncloud-zimlet <測試 NC v22 v24 |work>
	 @ dav = https://192.168.10.127 port=9680
	 @ /remote.php/dav/file/itadm   <使用帳號>
########################
2022.05.20 Fri
     @ 早上桌邊簡報完成，Jackson 傾向先 deploy Zimbra9 OSE作內部測試
     @ Mailsvr deploy on HP Microsvr <再附加 nextcloud><plus docker app>
	 @ Microsvr 安裝 ESXi <easy 備份與移轉> 再deploy mailsvr +nextcloud +docker svr
	 @ 架構圖，HDD 升級測試，infra map
########################
2022.05.24 Tue
     @ jackson 完成簡報，目光開始轉向更新公司
########################
2022.06.01 Wed
     @ officer [Elaine] 為完成最後報告忙碌中，同時已完成 103 權限控管
	 @ officer 四人皆可使用 < net use \\192.168.10.103\sup /d ><取消連線>
	 @ 找到 OpenLDAP 無法import 的原因，試作成功，但會造成share folder 斷線
	 @ 小心測試
########################
2022.06.08 有空新建VMs lab for gitlab
########################
122 ldap  A = ID / G = group 
103 freenas <local account to share folder>
@jackson<ID> + itadm<ID|ITewsn1234> => itadm <group>
@sup <ID | 1qaz#EDC> + sup1 <ID| 1qaz@WSX> + jackson +itadm => sup <group>
########################
## 連線 SMB share 帳戶未成，重啟 SMB 服務
net stop LanmanWorkstation /y  
net start LanmanWorkstation
########################
/opt/zimbra/libexec/zmfixperms
su - zimbra -c "指令"
chown -R zimbra:zimbra /opt/zimbra/backup
########################
game today
cc：form food to 35XXX~36000
fgo：get memory last

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
## labbing test step by step
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
