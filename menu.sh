#!/bin/bash

clear
echo -e "\n\tSYSTME INFORMATION MENU\n"
PS3="Select an option and press ENTER:"

select i in OS Host FileSystem Date Users Quit
do
	case $i in
		OS) echo
			uname
			;;
		Host) echo
			hostname
			;;
		FileSystem) echo
			df -k | more
			;;
		Date) echo
			date
			;;
		Users) echo
			who
			;;
		Quit) break
			;;
	esac
	
	REPLY=
	echo -e "\nPress Enter to Continue...\c"
	read

	clear
	echo -e "\n\tSystem Information Menu\n"
done

clear
