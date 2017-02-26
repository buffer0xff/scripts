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

#########################
# Please select a proxy # 
#########################

[0] hongkong        <-- current
[1] japan
[2] korea
[3] singapore
[4] taiwan
[5] usa

[*] Input Number:3
/etc/shadowsocks/singapore.json
INFO: loading config from /etc/shadowsocks/singapore.json
stopped
started

```
