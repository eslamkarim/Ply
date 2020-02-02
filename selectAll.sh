#!/bin/bash

showTableContent()
{
	tName=""
	echo "Please enter the table you want to show";
    	read tName

	while true 
	do
	   if [ -n "$tName" ]
       	   then
    		if [ -f "$tName" ]
    		then
        		break;
    		else
        		echo "There's no table with name $tName enter valid name"
        		read tName
    		fi
	   else
		echo "There's no table with name $tName enter valid name"
        	read tName
	   fi
	done

	while read -r line
	do
  	    echo "-----------------------------------------------------------------------------"
  	    echo $line
 	    echo "-----------------------------------------------------------------------------"
	done < $tName
	CRUD
}

