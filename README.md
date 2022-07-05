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
12:23 Chris Hsiang 所以我最後改用 samba4ad (特規 LDAP
12:23 麥詩 為了windows 10用戶端?
12:23 Chris Hsiang 一樣把 Windows 10 client 加入到 samba4ad domain
12:23 Chris Hsiang 但是它的 ad 版本只是 2008喲
12:24 Chris Hsiang samba4ad 都是放在 lxc 裡面而已
12:25 Chris Hsiang 也有 primary ad 跟 secondary ad 之間 sync
12:25 麥詩 嗯...這樣的坑...如果這只是分歧的TREE 不就坑更大.
12:25 Chris Hsiang 最多 tree 就好 別弄 forest
12:26 Chris Hsiang 好處是 windows login 跟 zimbra login 帳號同步
12:26 Chris Hsiang 這個超級重要
12:26 Chris Hsiang 而且還能透過 email 認證模式 修改 密碼
12:27 Chris Hsiang 連 nextcloud 認證都是同一個
12:27 Chris Hsiang 我是認為比較好的 single signon 的方式
12:27 養貓的陌生人 SSO肯定要啊

Centos 83+Sendmail+Roundcube
你可以 分 功能拆
proxy 一台
mailstore 一台
zimbraldap 一台
########################
2022.06.08 有空新建VMs lab for gitlab  || ubuntu22D for oh my zsh || UCS deploy 測試
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
##
issue101：lab 137 oxoffice 內建 docker nextcloud22 <同一個node>
issue102：Gsuite 與現行 mail2切換流程 <預計執行日 ?>
#############################
7月進度，app測試 for nextcloud / zimbra app login by ldap
寄信含檔 7 mb nextcould 連結 <look like fault>
