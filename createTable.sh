#!/bin/bash


createTable()
{
	echo "Enter table name"
	read tableName
	while true
	do
	  if [ -n "$tableName" ]
	  then
		if [ -f "$tableName" ]
		then 
			echo "table already exisit"
			echo "Enter table name"
			read tableName
		else	
			touch $tableName
			touch $tableName.md
			echo "Table Created Successfully"
			break;
		fi
	  else 
		echo "Name entered is not valid"
		read tableName
	  fi
	done


	echo "Enter number of cols"
	read num
	
	while true
	do 
	   echo "Enter PK Col Name"
	   read colName
	
	   while true
	   do
		if [ -n "$colName" ]
		then
			break
		else
			echo "enter Valid Name"
			read colName		
		fi
	   done	

	   echo "Enter PK Col DataType [num || varchar]"
	   read colDataT
	   while true
           do
		if [ -n "$colDataT" ]
		then
			if [[ "$colDataT" == "num" || "$colDataT" == "varchar" ]]
			then
			 	break
			else
				echo "Invalid Data Type" 
				read colDataT
			fi
		else
			echo "enter Valid Data Type"
			read colDataT		
		fi
	   done
	echo "$colName--$colDataT--1" >> $tableName.md
	break;	
	done
        
	j=1
	while ((j<$num))
	do
	   echo "Enter Col Name"
	   read colName
	   while true
	   do
		if [ -n "$colName" ]
		then
			break
		else
			echo "enter Valid Name"
			read colName		
		fi
	   done

	   echo "Enter Col DataType"
	   read colDataT
	   while true
           do
		if [ -n "$colDataT" ]
		then
			if [[ "$colDataT" == "num" || "$colDataT" == "varchar" ]]
			then
			 	break
			else
				echo "Invalid Data Type" 
				read colDataT
			fi
		else
			echo "enter Valid Data Type"
			read colDataT		
		fi
	   done

	   echo "$colName--$colDataT--0" >> $tableName.md
	   ((j++))
	done
	CRUD
}
