#!/bin/bash

DeleteRow(){
    echo "Please Select a table"
    read table_name
    if [[ -f "/usr/ply/$currentDb/$table_name" ]]
    then
        echo "PLease enter id to delete"
        read id
        line_number=$(awk -F'[ ]' -v id=$id '{
                        if ($1 == id){
                            print NR;
                        }
                        }' /usr/ply/$currentDb/$table_name)
        if [ -n "$line_number" ]
        then
            sed -i "$line_number d" /usr/ply/$currentDb/$table_name
            CRUD
        else
            echo "Wrong id"
            DeleteRow
        fi
    else
        echo "invalid table"
        DeleteRow
    fi
}