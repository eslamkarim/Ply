#!bin/bash

Select(){
    clear
    echo "Enter table name to select from"
    read table
    while true 
    do	
    	if [ -f "/usr/ply/$currentDb/$table" ]
    	then
       		break;
  	else
       		echo "There's no table with name $table enter valid name"
       		read table
    	fi
    done

    echo "Enter The PK"
    read id
		numOfRows=$(cat /usr/ply/$currentDb/$table | wc -l)
		if [ "$numOfRows" -gt "0" ]
		then
while true
do
    if [ -n "$id" ]
    then
    	value=`awk -F" " -v key=$id '{
     		if ($1 == key)
		        print $0;
        	}' /usr/ply/$currentDb/$table`
		if [ -n "$value" ]
		then
			echo $value
			break	
		else
			echo "id is not found please try again"
			break
		fi    	
    else
		echo "enter valid PK"
		read id 
    fi 
done
else 
	echo "sorry Table is Empty !!!"
fi
CRUD
}
