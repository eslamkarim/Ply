#!/bin/bash


createDB(){
    if [[ -d "/c/Users/Eslam/Desktop/ITI/Bash/Ply/ply" ]]
    then
        echo "Please enter the Database name to create"
        read dbname
        if [[ -d "/c/Users/Eslam/Desktop/ITI/Bash/Ply/ply/$dbname" ]]
        then
            clear
            echo "sorry Database already exists"
            showMenu
        else
            mkdir /c/Users/Eslam/Desktop/ITI/Bash/Ply/ply/$dbname
            clear
            echo "Database Created"
            showMenu
        fi
    else
        echo "making the dir this is only done for the first time"
        mkdir ply
        createDB
    fi
} 
