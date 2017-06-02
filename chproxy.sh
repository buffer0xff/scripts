#! /bin/bash

config_directory=/etc/shadowsocks
file_name_array=()

current_proxy=`ps -ef | grep -io  '/etc/shadowsocks/.*.json' | grep -v '*' | cut -d"/" -f 4 | cut -d"." -f1`

i=0
echo '
#########################
# Please select a proxy # 
#########################
'
for file_name in ${config_directory}/*; do
    file_name_array[$i]=$file_name
    pure_name=`echo $file_name | cut -d "/" -f4 | cut -d "." -f1` 
    if [ $pure_name == $current_proxy ]; then
        echo "[$i] $pure_name        <-- current" 
    else
        echo [$i] $pure_name
    fi
    let i=$i+1
done

echo -n "
[*] Input Number:" 

read index
echo ${file_name_array[$index]}
sudo sslocal -c ${file_name_array[$index]} -d restart
