#!/bin/bash

list(){
    if [ -z "$(ls -A -- "/usr/ply")" ]; 
    then
        clear
        echo "No Databases present"
        showMenu
    else
        for db in `ls /usr/ply`
        do
            echo "database: $db"
            if [ -z "$(ls -A -- "/usr/ply/$db")" ]; 
            then
                echo "Empty Database"
            else
                for table in `ls /usr/ply/$db`
                do
                    echo "$table"
                done
            fi
            echo "=============================================="
        done
    fi
}