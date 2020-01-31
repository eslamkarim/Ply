#!bin/bash

Select(){
    clear
    echo "Enter table name to select from"
    read table
    echo "Enter The id"
    read id
    echo "`awk -F"," -v key=$id '{
        if ($1 == key)
	        print $0;
        }' /usr/ply/$currentDb/$table`"
    CRUD
}