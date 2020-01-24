#!/bin/bash


createDB(){
    if [[ -d "/usr/ply" ]]
    then
        echo "Please enter the Database name to create"
        read dbname
        if [[ -d "/usr/ply/$dbname" ]]
        then
            clear
            echo "sorry Database already exists"
            showMenu
        else
            mkdir /usr/ply/$dbname
            clear
            echo "Database Created"
            showMenu
        fi
    else
        echo "making the dir this is only done for the first time"
        engine="/usr/ply"
        mkdir $engine
        createDB
    fi
} 
