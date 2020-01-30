#!/bin/bash

CRUD(){
    echo "Welcome to PLY database engine. Please Select an option";
    select opt in "Create Table" "Delete Table" "Select From Table" "List Tables" "Delete Row" "exit";
    do
        case $opt in
            "Create Table" )
                echo "create Table"
                clear
                createTable
                break
                ;;
            "Delete Table" )
                echo "Delete a table"
                break
                ;;
            "Select From Table" )
                echo "select from a table some attributes"
                Select
                break
                ;;
            "List Tables" )
                echo "This is the list tables in $currentDb"
                break
                ;;
            "Delete Row" )
                echo "this is row deletition"
                DeleteRow
                break
                ;;
            "exit" )
                echo "Thanks for using Ply"
                exit
                ;;
            * )
                echo "Wrong Selection"
                ;;
        esac
    done
}