#!/bin/bash

clear;
. ./createDB.sh
. ./useDB.sh
. ./CRUD.sh
. ./list.sh
. ./createTable.sh
. ./metadata.sh
. ./deleteTable.sh
. ./deleteDB.sh
. ./insertRow.sh
. ./selectAll.sh

showMenu(){
    if [ $EUID -ne 0 ]; then
        echo "The script must have sudo premission."
        sudo "$0"
        exit 1
    fi
    echo "Welcome to PLY database engine. Please Select an option";
    select opt in "Create Database" "Use DataBase" "List Databases and Tables" "Delete DataBase" "exit";
    do
        case $opt in
            "Create Database" )
                echo "create DB"
                createDB
                break
                ;;
            "Use DataBase" )
                echo "use dB"
                useDB
                break
                ;;
            "List Databases and Tables" )
                echo "list db and tables"
                list
                break
                ;;
            "Delete DataBase" )
                echo "Delete a database"
		deleteDB
                break
                ;;
            "exit" )
                echo "Thank you for using PLY"
                exit
                break
                ;;
            * )
                echo "Wrong Selection"
                ;;
        esac
    done
}

showMenu
