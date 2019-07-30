#!/bin/bash 
echo -n "Enter name and lab number"
printf "\n"
read name
sudo mkdir /home/cyberop/$name
sudo mkdir /home/cyberop/zipfiles

echo -n "Enter number of days you want to scan"
printf "\n"
read days

for x in `seq $days`; do
    sudo find /home -name "*.png" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
    sudo find /home -name "*.pcapng" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
    sudo find /home -name "*.pcap" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
    sudo find /home -name "*.cap" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
    sudo find /home -name "*.csv" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
    sudo find /home -name "*.netxml" -mtime $x -prune ! -path "*/.cache/*" -ls -exec mv -t /home/cyberop/$name {} +
done
sudo zip -r $name.zip $name
sudo mv *.zip /home/cyberop/zipfiles
sudo rm -r /home/cyberop/$name 
