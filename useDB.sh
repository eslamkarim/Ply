#!/bin/bash

useDB(){
    echo "Please enter the Database you wish to use";
    read currentDb
    if [[ -d "/usr/ply/$currentDb" ]]
    then
        export currentDb
        cd /usr/ply/$currentDb
        CRUD
    else
        echo "There's no database with name $currentDb"
        useDB
    fi
}
