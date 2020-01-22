#!/bin/bash

clear;
createDB(){
    if [[ -d "/c/Users/Eslam/Desktop/ITI/Bash/Ply/ply" ]]
    then
        echo "Please enter the Database name to create"
        read dbname
        if [[ -d "/c/Users/Eslam/Desktop/ITI/Bash/Ply/ply/$dbname" ]]
        then
            "sorry Database already exists"
        else
            mkdir /c/Users/Eslam/Desktop/ITI/Bash/Ply/ply/$dbname
            echo "Database Created"
        fi
    else
        echo "making the dir"
        mkdir ply
    fi
} 