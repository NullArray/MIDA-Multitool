#!/bin/bash

function usage()
{	clear 2>/dev/null
	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n"
	
	printf "\n Bash Kit - Multitool aims to be a comprehensive assistant for operations
and utilities related to system enumeration, vulnerability identification,
exploitation and privilege escalation. 

The 'Usage' option prints this informational message. The option 'System Enumeration'
Attempts to retrieve system information such as OS and kernel details, network status,
processes, system logs and more. 'Common Utilities' checks for the existence of
useful utilities such as telnet, netcat, tcpdump etc. 'External Utilities' opens
a menu which lets you download external utilities that may prove to be helpful
with further enumeration, vulnerability identification and privilege escalation.

Finally the option 'Cleartext Credentials' searches for text and web application
files that contain certain keywords in order to find potential cleartext passwords. 
"

main
	
}

function init_enum()
{	clear 2>/dev/null
	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n"
	printf "\n\nThis module enumerates system information and appends it to a textfile.\n"
	printf "\nThese items will be enumerated: 
	
1. User IDs login history & /etc/passwd.
2. OS details and mounted disks, kernel.
3. Network status and information.
4. Process info & cron jobs.
5. System logs. \n\n"
    
    read -p 'Continue? Y/n : ' choice
    if [[ $choice == 'n' ]]; then
		echo "Aborted"
		main
    fi

	printf "\n\nPlease provide a path to which the output will be saved. I.e /tmp/output.txt\n"
	read -p 'Path to outfile : ' outfile
	
	echo "+-+-+-+-+" | tee -a $outfile
	echo "|L|O|G|S|" | tee -a $outfile
	echo "+-+-+-+-+" | tee -a $outfile
		
	printf "\n\nUser IDs\n" | tee -a $outfile
	
	user=$(whoami) && printf "\nCurrent user: $user\n"  | tee -a $outfile
	
	printf "\n\n Other Users\n" | tee -a $outfile
	cat /etc/passwd | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	cat /etc/shadow | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	id | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	last | tee -a $outfile 1>&2
	sleep 0.5 && clear 2>/dev/null
		
	printf "\n\nOS details and mounted disks\n\n" | tee -a $outfile
	
	cat /etc/hostname | tee -a $outfile
	printf "\n\n" | tee -a $outfile
	uname -a | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	dpkg -l linux-image-\* | grep ^ii | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 
	df -h | tee -a $outfile 1>&2
	sleep 0.5 && clear 2>/dev/null
		
	printf "\n\nNetwork status & info\n\n" | tee -a $outfile
		
	ifconfig -a | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	arp -e | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile
	netstat -atp | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 
        cat /etc/hosts | tee -a $outfile 1>&2
	printf "\nListening nodes | tee -a $outfile
	lsof -i | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 
	iptables -L | tee -a $outfile 1>&2
	sleep 0.5 && clear 2>/dev/null
		
	printf "\n\nProcess info\n\n" | tee -a $outfile
	ps -d -f | tee -a $outfile 1>&2
	
	printf "\n\n Cron jobs.\n\n" | tee -a $outfile
	echo "Daily\n" | tee -a $outfile
	ls -la /etc/cron.daily/ | tee -a $outfile 1>&2
	echo "\nWeekly\n" | tee -a $outfile
	ls -la /etc/cron.weekly/ | tee -a $outfile 1>&2
	echo "\nMonthly\n" | tee -a $outfile
	ls -la /etc/cron.monthly/ | tee -a $outfile 1>&2
	sleep 0.5 && clear 2>/dev/null
	
	printf "\n\nSystem Logs\n\n" | tee -a $outfile
	find / -name "*.log" | tee -a $outfile 1>&2
		
	echo "Done, output saved to $outfile" 
	sleep 1
	main
}		


function common_util()
{	clear 2>/dev/null
	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n"
	printf "\n\nListing common, available utilities\n\n"
				
	which curl 2>/dev/null
	which wget 2>/dev/null
	which telnet 2>/dev/null
	which netcat 2>/dev/null
	which tcpdump 2>/dev/null
	which nmap 2>/dev/null
	which mknod 2>/dev/null
	which ssh 2>/dev/null
	which python 2>/dev/null
	which ruby 2>/dev/null
	which perl 2>/dev/null
	which gcc 2>/dev/null
				
	printf "\n\nDone. Would you like to list all utilities?\n\n"
	read -p 'Continue? Y/n : ' choice
	if [[ $choice == 'y' ]]; then
		 printf "\n\n"
		 ls -alh /usr/bin/
	else
		printf "\n\nReturning to menu.\n\n"
	fi
	
	main
}		

function cleartext()
{	clear 2>/dev/null
	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n"
	printf "\n\nThis module looks for web application and text files containing certain
keywords in order to find cleartext passswords and usernames. Currently files ending in 
'.php', '.sql' and '.txt' will be searched. Results will be saved to a textfile\n\n"
	
	read -p 'Continue? Y/n : ' choice
    	if [[ $choice == 'y' ]]; then
		reap -p 'Path to outfile: ' cred_out
		
		printf "\nPHP Files\n" | tee -a $cred_out
		find / -name "*.php" -print0 |  xargs -0 grep -i -n "var password" | tee -a $cred_out 1>&2
		find / -name "*.php" -print0 |  xargs -0 grep -i -n "var user" | tee -a $cred_out 1>&2
		sleep 0.5 && clear 2>/dev/null
		
		printf "\nSQL Files\n" | tee -a $cred_out
		find / -name "*.sql" -print0 |  xargs -0 grep -i -n "password" | tee -a $cred_out 1>&2
		find / -name "*.sql" -print0 |  xargs -0 grep -i -n "user" | tee -a $cred_out 1>&2
		sleep 0.5 && clear 2>/dev/null
		
		printf "\nText Files\n"
		find / -name "*.txt" -print0 |  xargs -0 grep -i -n "password" | tee -a $cred_out 1>&2
		find / -name "*.txt" -print0 |  xargs -0 grep -i -n "username" | tee -a $cred_out 1>&2
		sleep 0.5 && clear 2>/dev/null
		
		echo "Done, output saved to $cred_out"
		sleep 1
		main
	else
		echo "Aborted"
		main
	fi

}


function ext_util()
{	clear 2>/dev/null
	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n\n"
	printf "\n\nThis module provides a number of external utilities to download.
Choose a utility to start downloading and unpacking it in the /tmp/ directory\n"
	
	PS3='Please enter your choice: '
	options=("LinEnum - System enumeration" "Firmwalker - Advanced enumeration" "LUNAR - Unix security auditing" "PyCat - Python network tool" "Python exploit suggester" "Perl exploit suggester" "Priv-Esc checker" "All" "Done")
	select opt in "${options[@]}"
	do
		case $opt in
			"LinEnum - System enumeration")
				printf "\n\n"
				wget -O /tmp/LinEnum.zip https://github.com/rebootuser/LinEnum/archive/master.zip
				;;
			"Firmwalker - Advanced enumeration")
				printf "\n\n"
				wget -O /tmp/firmwalker.zip https://github.com/craigz28/firmwalker/archive/master.zip
				;;
			"LUNAR - Unix security auditing") 
				printf "\n\n"				
				wget -O /tmp/LUNAR.zip https://github.com/lateralblast/lunar/archive/master.zip
				;;
			"PyCat - Python network tool")
				printf "\n\n"
				wget -O /tmp/PyCat.zip https://github.com/NullArray/PyCat/archive/master.zip
				;;
			"Python exploit suggester")
				printf "\n\n"
				wget -O /tmp/ExploitSuggest.py http://www.securitysift.com/download/linuxprivchecker.py
				;;
			"Perl exploit suggester")
				printf "\n\n"
				wget -O /tmp/ExploitSuggest_perl.zip https://github.com/PenturaLabs/Linux_Exploit_Suggester/archive/master.zip 
				;;
			"Priv-Esc checker")
				printf "\n\n"
				wget -O /tmp/unixprivesc.zip https://github.com/pentestmonkey/unix-privesc-check/archive/1_x.zip
				;;
			"All")
				wget -O /tmp/LinEnum.zip https://github.com/rebootuser/LinEnum/archive/master.zip
				wget -O /tmp/firmwalker.zip https://github.com/craigz28/firmwalker/archive/master.zip
				wget -O /tmp/LUNAR.zip https://github.com/lateralblast/lunar/archive/master.zip
				wget -O /tmp/PyCat.zip https://github.com/NullArray/PyCat/archive/master.zip
				wget -O /tmp/ExploitSuggest.py http://www.securitysift.com/download/linuxprivchecker.py
				wget -O /tmp/ExploitSuggest_perl.zip https://github.com/PenturaLabs/Linux_Exploit_Suggester/archive/master.zip
				wget -O /tmp/unixprivesc.zip https://github.com/pentestmonkey/unix-privesc-check/archive/1_x.zip
				;;
			"Done") 
				break
				;;
			*) echo invalid option;;
		esac
	done
	
	printf "\n\nIn case external utilities were downloaded would you like Bash Kit to automatically unzip them?\n\n"
	read -p '[Y]es/[N]o: ' choice
	
	if [[ $choice == 'y' ]]; then
	
		dir=$(pwd) && cd /tmp/
		printf "\n\nUnzipping downloaded packages where applicable.\n\n"
	
		for zip in *.zip
		do
			dirname=`echo $zip | sed 's/\.zip$//'`
			if mkdir $dirname
			then
				if cd $dirname
				then
					unzip ../$zip
					cd ..
					rm -f $zip
				else
					echo "Could not unpack $zip - cd failed"
				fi
			else
				echo "Could not unpack $zip - mkdir failed"
			fi
		done
		cd $dir
		
		printf "\n\nDone, returning to menu...\n\n"
		sleep 1
		main
	
	else
		printf "\n\nReturning to menu\n\n" 
		main
	fi
}


function main()
{	echo " _____         _    _____ _ _   "   
	echo "| __  |___ ___| |_ |  |  |_| |_ " 
	echo "| __ -| .'|_ -|   ||    -| |  _|"
	echo "|_____|__,|___|_|_||__|__|_|_|  "
	printf "\nBash Kit - Multitool\n\n"
	
	PS3='Please enter your choice: '
	options=("Usage" "System Enumeration" "Common Utilities" "External Utilities" "Cleartext Credentials" "Quit")
	select opt in "${options[@]}"
	do
		case $opt in
			"Usage")
				usage
				;;
			"System Enumeration")
				init_enum
				;;
			"Common Utilities")
				common_util
				;;
			 "External Utilities")
				ext_util
				;;
			 "Cleartext Credentials")
				cleartext
				;;
			 "Quit") 
				break
				exit 1
				;;
			*) echo invalid option;;
		esac
	done
}

main
