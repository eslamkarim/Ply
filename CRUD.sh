#!/bin/bash

CRUD(){
    echo "Welcome to PLY database engine. Please Select an option";
    select opt in "Create Table" "Delete Table" "Insert Row" "Select From Table" "Select all from Table" "List Tables" "exit";
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
		        deleteTable
                break
                ;;
            "Select From Table" )
                echo "select from a table some attributes"
                Select
                break
                ;;
            "Select all from Table" )
		        showTableContent
		        break
		        ;;
	        "Insert Row" )
		        insertRow
		        break
		        ;;
            "List Tables" )
                echo "This is the list tables in $currentDb"
                listTables
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
