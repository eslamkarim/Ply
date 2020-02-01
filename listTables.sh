#!/bin/bash

listTables(){
    clear
    if [ -d "/usr/ply/$currentDb" ]; 
    then
            echo "database: $currentDb"
            if [ -z "$(ls -A -- "/usr/ply/$currentDb")" ]; 
            then
                echo "Empty Database"
            else
                for table in `ls -I "*.md" /usr/ply/$currentDb `
                do
                    echo "$table"
            done
        fi
        echo "=============================================="
    else
        clear
        echo "No Database present"
        CRUD
    fi
    CRUD
}