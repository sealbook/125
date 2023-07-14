#!/bin/bash
#   This script will allow your linux desktop to join a Univention Server domain
#   This will allow you connect to an LDAP,Kerberos,Samba server
#   This was tested on Centos7.5 logging into Univention Server, but might work for other servers too
#
#   https://www.univention.com/
#
# this script was made following this website post
# https://help.univention.com/t/member-server-kerberos-user-authentication/4516/4
#
#   User Edit Section
#
# Set IP of Domain-Controller
# LDAP IP 位置
MASTER_IP=192.168.10.230 # LDAP Server IP
# LDAP 主機連線位置
ldap_master=ucs.infowize.intra # my DNS to the ldap
# LDAP 網域名稱
ldap_base="dc=infowize,dc=intra"
# 取得本機名稱
hostname=$(hostname) # set the hostname you want to register with Univention

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# the rest of this script should just work by it self.
# for an explanation of what this script is doing, go to https://docs.software-univention.de/domain-4.1.html#ext-dom-ubuntu

# Step 0
# install all necessary packages
apt-get -y install sssd libnss-sss libpam-sss libsss-sudo lsb-release slapd

echo " Variables set: going to step 1"

# step 1
# integration into the LDAP directory and SSL certificate authority
echo " Attempting to connect to the LDAP server to obtain certificate"
echo " 連線 Univention 伺服器取得 LDAP 憑證 "
echo " Please enter the password for the root user to the LDAP Server (for copying certs)"
echo " 請輸入 Univention 伺服器 root 密碼(複製憑證) "
echo "     ssh root@${ldap_master} [enter password]"
mkdir /etc/univention
ssh -n root@${MASTER_IP} 'ucr shell | grep -v ^hostname=' >/etc/univention/ucr_master
echo "master_ip=${MASTER_IP}" >>/etc/univention/ucr_master
chmod 660 /etc/univention/ucr_master
. /etc/univention/ucr_master

# add the ldap dns and ip into /etc/hosts
# 增加 UCS 連線位置到 hosts
echo "${MASTER_IP} ${ldap_master}" >>/etc/hosts

echo " step1: complete"
echo ""
echo " step2: starting"

# step 2
# Create account on the server to Gain read access
# 建立帳號並且產生密碼加密到 `/etc/ldap.secret`

# Download the SSL certificate
# 下載 UCS 憑證存在本機上
mkdir -p /etc/univention/ssl/ucsCA/
wget -O /etc/univention/ssl/ucsCA/CAcert.pem \
    http://${ldap_master}/ucs-root-ca.crt

# Create an account and save the password
password="$(tr -dc A-Za-z0-9_ </dev/urandom | head -c20)"
echo "     ssh root@${ldap_master} [enterdevlab.asrc password]"
ssh -n root@${ldap_master} udm computers/linux create \
    --position "cn=computers,${ldap_base}" \
    --set name=$(hostname) --set password="${password}" \
    --set operatingSystem="$(lsb_release -is)" \
    --set operatingSystemVersion="$(lsb_release -rs)" 
printf '%s' "$password" >/etc/ldap.secret
chmod 0400 /etc/ldap.secret

echo "step2: complete"
echo ""
echo "step3: starting"

# Step 3
echo "正在設定 LDAP 相關設定"
# Create ldap.conf locally
# 建立 LDAP 設定檔
cat >/etc/ldap/ldap.conf <<__EOF__
TLS_CACERT /etc/univention/ssl/ucsCA/CAcert.pem
URI ldap://$ldap_master:7389
BASE $ldap_base
__EOF__

echo "step3:complete"
echo ""
echo "step4: starting"

# Step 4
echo "正在設定 sssd 相關設定"
# sssd
# 設定 sssd 設定檔
cat >/etc/sssd/sssd.conf <<___EOF___
[sssd]
config_file_version = 2
reconnection_retries = 3
sbus_timeout = 30
services = nss, pam, sudo
domains = $kerberos_realm

[nss]
reconnection_retries = 3

[pam]
reconnection_retries = 3

[domain/$kerberos_realm]
auth_provider = krb5
krb5_kdcip = ${MASTER_IP}
krb5_realm = ${kerberos_realm}
krb5_server = ${ldap_master}
krb5_kpasswd = ${ldap_master}
id_provider = ldap
ldap_uri = ldap://${ldap_master}:7389
ldap_search_base = ${ldap_base}
ldap_tls_reqcert = never
ldap_tls_cacert = /etc/univention/ssl/ucsCA/CAcert.pem
cache_credentials = true
enumerate = true
ldap_default_bind_dn = cn=$(hostname),cn=computers,${ldap_base}
ldap_default_authtok_type = password
ldap_default_authtok = $(cat /etc/ldap.secret)
___EOF___

chmod 600 /etc/sssd/sssd.conf

echo "啟動 sssd 服務"
# 啟動服務
systemctl restart sssd && systemctl enable sssd

# 登入時會自動建立家用目錄
cat >/usr/share/pam-configs/ucs_mkhomedir <<__EOF__
Name: activate mkhomedir
Default: yes
Priority: 900
Session-Type: Additional
Session:
    required    pam_mkhomedir.so umask=0022 skel=/etc/skel
__EOF__

DEBIAN_FRONTEND=noninteractive pam-auth-update --force

# Become root
# 登入後會系統會自動該帳號某些系統
echo '*;*;*;Al0000-2400;audio,cdrom,dialout,floppy,plugdev,adm' \
   >>/etc/security/group.conf

cat >>/usr/share/pam-configs/local_groups <<__EOF__
Name: activate /etc/security/group.conf
Default: yes
Priority: 900
Auth-Type: Primary
Auth:
    required    pam_group.so use_first_pass
__EOF__

DEBIAN_FRONTEND=noninteractive pam-auth-update --force

# Install required packages
# 安裝必要套件
apt-get install -y heimdal-clients ntpdate

# 設定 Kerberos 基本設定檔
# Default krb5.conf
cat >/etc/krb5.conf <<__EOF__
[libdefaults]
    default_realm = ${kerberos_realm}
    kdc_timesync = 1
    ccache_type = 4
    forwardable = true
    proxiable = true
    default_tkt_enctypes = arcfour-hmac-md5 des-cbc-md5 des3-hmac-sha1 des-cbc-crc des-cbc-md4 des3-cbc-sha1 aes128-cts-hmac-sha1-96 aes256-cts-hmac-sha1-96
    permitted_enctypes = des3-hmac-sha1 des-cbc-crc des-cbc-md4 des-cbc-md5 des3-cbc-sha1 arcfour-hmac-md5 aes128-cts-hmac-sha1-96 aes256-cts-hmac-sha1-96
    allow_weak_crypto=true

[realms]
$kerberos_realm = {
    kdc =  ${MASTER_IP}  ${ldap_master}
    admin_server = ${MASTER_IP}  ${ldap_master}
    kpasswd_server = ${MASTER_IP}  ${ldap_master}
}
__EOF__

# Synchronize the time with the UCS system
# 與 UCS 主機同步時間
ntpdate -bu ${ldap_master}

# Test Kerberos: kinit will ask you for a ticket and the SSH login to the master should work with ticket authentication:
# 測試 Kerberos 服務： kinit 會用 SSH 方式與 UCS 主機進行連線測試
kinit Administrator
ssh -n Administrator@${ldap_master} ls /etc/univention

# Destroy the kerberos ticket
kdestroy