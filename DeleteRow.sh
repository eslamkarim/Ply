#!/bin/bash

DeleteRow(){
    clear
    echo "Please Select a table"
    read table_name
    echo "PLease enter id to delete"
    read id
    line_number="`awk -F"," -v key=$id '{
        if ($1 == key){
            print NR
        }
        }' /usr/ply/$currentDb/$table_name`"
    sed -i "$line_number d" /usr/ply/$currentDb/$table_name
}