#!/bin/bash

#
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
# 安裝必要套件
dnf install sssd sssd-tools sssd-ldap openldap-clients authconfig redhat-lsb-core oddjob-mkhomedir -y

echo " Variables set: going to step 1"

# Step 1
# integration into the LDAP directory and SSL certificate authority
echo " Attempting to connect to the LDAP server to obtain certificate"
echo " 連線 Univention 伺服器取得 LDAP 憑證 "
echo " Please enter the password for the root user to the LDAP Server (for copying certs)"
echo " 請輸入 Univention 伺服器 root 密碼(複製憑證) "
echo "     ssh root@${ldap_master} [enter password]"
# 建立 univention 目錄
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
# Create an account and save the password
# 建立帳號並且產生密碼加密到 `/etc/ldap.secret`
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
cat >/etc/openldap/ldap.conf <<__EOF__
TLS_CACERT /etc/openldap/certs/CAcert.pem
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
ldap_tls_cacert = /etc/openldap/certs/CAcert.pem
cache_credentials = true
enumerate = true
ldap_default_bind_dn = cn=$(hostname),cn=computers,${ldap_base}
ldap_default_authtok_type = password
ldap_default_authtok = $(cat /etc/ldap.secret)
___EOF___

chmod 600 /etc/sssd/sssd.conf

echo "step4: complete"

echo "啟動 sssd 服務"
# 啟動服務
systemctl restart sssd oddjobd && systemctl enable sssd oddjobd

#  LAST STEP !!
# 最後一步
# 用 authconfig 文字命令設定與 UCS 連線並且自動同步資訊
# launch authconfig
# authconfig --enableldap --enableldapauth --ldapserver=ldap://${ldap_master}:7389/ --ldapbasedn=${ldap_base} --enablemkhomedir --update
authselect select sssd with-mkhomedir --force

# Create account on the server to Gain read access
# 下載 UCS 憑證存在本機上
wget -O /etc/openldap/certs/CAcert.pem http://${ldap_master}/ucs-root-ca.crt