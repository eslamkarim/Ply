#!/bin/bash

deleteTable()
{
	echo "Enter Table Name that you want to Delete"
	read name
	if [ -n "$name" ]
      	then
		if [[ -f "$name" ]]
    		then
			rm -r $name
			rm -r $name.md
        		echo "Table Deleted Successfully" 
        		CRUD
    		else
        		echo "There is no table with name $name"
        		CRUD
    		fi
	else
		echo "There is no Table with name $name"
        	deleteDB
	fi
}

