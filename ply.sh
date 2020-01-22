#!/bin/bash

clear;
. ./createDB.sh
echo "Welcome to PLY database engine. Please Select an option";
select opt in "Create Database" "Use DataBase" "List Databases and Tables";
do
    case $opt in
        "Create Database" )
            echo "create DB"
            createDB
            break
            ;;
        "Use DataBase" )
            echo "use dB"
            break
            ;;
        "List Databases and Tables" )
            echo "list db and tables"
            break
            ;;
        * )
            echo "Wrong Selection"
            ;;
    esac
done
