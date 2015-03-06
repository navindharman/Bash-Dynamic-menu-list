#!/bin/bash
 
while true; do
	read -p "Do you want to modify the menu list(yn)?:" yn
	case $yn in
		[Yy]* ) 
read -p "To add content press 'a' or to remove content press 'r':" k
if [ $k = a ]; then

	echo -n "Add new item to menu list using following format(3.dir):" 
	read word
	read
	sed "$ a\ $word" /naveen/nav/menu.txt > /naveen/nav/menu.txt.new
	mv /naveen/nav/menu.txt.new /naveen/nav/menu.txt
	echo -n "Add script to execute:"
	var=$(cat menu.txt | tail -n1 | cut -d '.' -f1) 
	sh /naveen/nav/variable.sh > var
	read
        cd name/	
	vi $var.sh
	#!/bin/bash
	sed "$ i\ $script" /naveen/nav/name/$var
	mv /naveen/nav/$var /naveen/nav/name/$var.sh
	chmod +x /naveen/nav/name/$var.sh
	echo "Menu list modified" 

elif [ $k = r ]; then 
	echo -n "enter the menu nos(eg:3.dir = 3):"
	read nos
	read
	while true; do
		sed /$nos/d  /naveen/nav/menu.txt > /naveen/nav/menu.txt.new
		mv /naveen/nav/menu.txt.new /naveen/nav/menu.txt
		rm /naveen/nav/name/$nos.sh
		break
	done	
else
	echo "kindly select either a or r"  
fi
	exit ;;
	 [Nn]* ) exit;;
	* ) echo "Please kindly answer yes or no." ;;
esac
done

