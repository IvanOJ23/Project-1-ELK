#!/bin/bash

if [ $UID = 0 ]
then
	echo "This script should not be run as root!"
	exit
fi

output=~/research/sys_info.txt
impt_files=(
	/etc/shadow
	/etc/passwd
)
# if research dir not there, create it
if [ -d $HOME/research  ]
then
	mkdir $HOME/research 2> /dev/null
fi

# if output file doesnt exist, create it
if [ ! -f $output ]
then
	touch $output
fi

echo "System Info" >> $output

date >> $output

echo "Machine Type Info:" >> $output

echo $MACHTYPE >> $output

echo -e "uname info: $(umame -e) \n" >> $output

echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> $output

echo "Hostname: $(hostname -s)" >> $output

echo "DNS Servers: " >> $output

cat /etc/resolv.conf | grep -v '#' >> $output

echo "Memory Info:" >> $output

free >> $output

echo -e "\nCPU Info:" >> $output

lscpu | grep CPU >> $output

echo -e "\nDisk Usage:" >> $output

df -H | head -2 >> $output

# Run Time Info
echo -e "\n Who's logged in: \n$(who -a) \n" >> $output


for file in ${impt_files[@]};
do
	ls -l $file >> $output
done
echo -e "Sudo permissions for all users with home dirs" >> $output
users=$(ls /home) 
for name in ${users[@]}; >> $output
do
	if [ -d /home/$name ] >> $output
	then
	sudo -lu $name >> $output
	fi
done

