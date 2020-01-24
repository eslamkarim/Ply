#!/bin/bash

CRUD(){
    echo "Welcome to PLY database engine. Please Select an option";
    select opt in "Create Table" "Delete Table" "Select From Table" "List Tables" "exit";
    do
        case $opt in
            "Create Table" )
                echo "create Table"
                break
                ;;
            "Delete Table" )
                echo "Delete a table"
                break
                ;;
            "Select From Table" )
                echo "select from a table some attributes"
                break
                ;;
            "List Tables" )
                echo "This is the list tables in $currentDb"
                break
                ;;
            * )
                echo "Wrong Selection"
                ;;
        esac
    done
}