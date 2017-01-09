# scripts
Some scripts

# chproxy.sh Usage
**If you have more than one sslocal configure files. chproxy.sh can help you switch your shadowsocks to different configure file quickly.**

1. Create directory /etc/shadowsocks
2. Put all your shadowsocks configure file into /etc/shadowsocks/
3. Run chproxy.sh and select your config file

## Example
```
user@ubuntu:~$ chproxy 

[0]/etc/shadowsocks/cn1_10500.json
[1]/etc/shadowsocks/cn2_10500.json
[2]/etc/shadowsocks/cn2_6500.json
[3]/etc/shadowsocks/cn3_10500.json
[4]/etc/shadowsocks/cn3_6500.json
[5]/etc/shadowsocks/hk1_10500.json
[6]/etc/shadowsocks/tw1_6500.json

[*] Please select a config file: 3
/etc/shadowsocks/cn3_10500.json
INFO: loading config from /etc/shadowsocks/cn3_10500.json
2016-10-23 23:56:31 WARNING  warning: your timeout 60 seems too short
2016-10-23 23:56:31 INFO     loading libcrypto from libcrypto.so.1.0.0
stopped
started

```
