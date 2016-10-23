#! /bin/bash

config_directory=/etc/shadowsocks
file_name_array=()

i=0
echo ""
for file_name in ${config_directory}/*; do
    file_name_array[$i]=$file_name
    echo [$i]$file_name
    let i=$i+1
done

echo ""
echo -n "[*] Please select a config file: "
read index
echo ${file_name_array[$index]}
sudo sslocal -c ${file_name_array[$index]} -d restart
