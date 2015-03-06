#!/bin/bash
LSB=/usr/bin/lsb_release
Author=NAVEEN_DHARMAN
function pause(){
        local message="$@"
	         [ -z $message ] && message="Press [Enter] key to continue..."
		 read -p "$message" readEnterKey
		 }
function write_header(){
         local h="$@"
         echo "---------------------------------------------------------------"
         echo "     ${h}"
         echo "---------------------------------------------------------------"
					 }

function show_menu(){
menu="/naveen/nav/menu.txt"
echo "-----------------Control Menu-----------------"
while read line
do
	echo $line
	done < $menu
echo "-----------------------------------------------"
echo "  0.Option                      x.Exit         "  
}
function read_input(){	
	f=$(cat /naveen/nav/menu.txt | head | cut -d '.' -f1 )
	read -p "Enter your choice:" c
	case $c in
		x) echo "Thanks for using the script $Author "; exit 0 ;;
		0) sh /naveen/nav/option.sh; pause ;;
		*) if grep -q $c <<< $f;
		then
			sh /naveen/nav/name/$c.sh; pause		
		else
			echo "Kindly enter a valid menu number"; pause
		fi
       esac      
}

while true
do
	clear	
	show_menu
	read_input
done	
 
