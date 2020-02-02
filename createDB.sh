#!/bin/bash

createDB(){
    if [[ -d "/usr/ply" ]]
    then
        while true
        do
            echo "Please enter the Database name to create"
            read dbname
            if [[ $dbname =~ $varchar ]]1
            then
                if [[ -d "/usr/ply/$dbname" ]]
                then
                    clear
                    echo "sorry Database already exists"
                    showMenu
                else
                    mkdir /usr/ply/$dbname
                    clear
                    echo "Database Created"
                    currentDb=$dbname
                    export currentDb
                    cd /usr/ply/$dbname
                    CRUD
                fi
            else
                echo "please enter a string name"
            fi
        done
    else
        echo "making the dir this is only done for the first time"
        engine="/usr/ply"
        mkdir $engine
        createDB
    fi
} 
