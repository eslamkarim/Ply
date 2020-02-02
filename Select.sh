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
while true
do
    if [ -n "$id" ]
    then
    	value=`awk -F" " -v key=$id '{
     	  	 if ($1 == key)
		        print $0;
        	else print "notFound"}' /usr/ply/$currentDb/$table`
	if [ "$value" == "notFound" ]
	then
		echo "id is not found please try again"
		read id
	else
		echo $value
		break
	fi
    	
    else
		echo "enter valid PK"
		read id 
    fi 
done
CRUD
}
