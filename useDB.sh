#!/bin/bash

useDB(){
    echo "Please enter the Database you wish to use";
    read currentDb
    if [[ -d "/usr/ply/$currentDb" ]]
    then
        echo "call the menu file of crud operations"
        export currentDb
    else
        echo "There's no database with name $currentDb"
        useDB
    fi
}