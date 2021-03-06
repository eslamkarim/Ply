#!/bin/bash

deleteDB()
{
	echo "Enter Database Name that you want to Delete"
	read dbname
	if [ -n "$dbname" ]
       	then
		if [[ -d "/usr/ply/$dbname" ]]
    		then
			sudo rm -r /usr/ply/$dbname
        		echo "Database Deleted Successfully" 
        		showMenu
    		else
        		echo "There is no Database with name $dbname"
        		showMenu
    		fi
	else
		echo "There is no Database with name $dbname"
        	deleteDB
	fi
}
