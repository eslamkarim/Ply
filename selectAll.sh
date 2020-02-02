#!/bin/bash

showTableContent()
{
	tName=""
	while true 
	do
		echo "Please enter the table you want to show";
    		read tName
    		if [ -f "$tName" ]
    		then
        		break;
    		else
        		echo "There's no table with name $tName"
    		fi
	done

	while read -r line
	do
  	    echo $line
	done < $tName
	CRUD
}

