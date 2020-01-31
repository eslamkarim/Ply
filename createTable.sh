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
	j=0
	while ((j<$num))
	do
	   echo "Enter Col Name"
	   read colName
	   echo "Enter Col DataType"
	   read colDataT
	   echo "Do you want it to be P.KEY (y/n)?"
	   read ans
	   pk=0
	   if [[ "$ans" = "y" ]] || [[ "$ans" = "Y" ]]
	   then
			pk=1
       	fi 
	   echo "$colName--$colDataT--$pk" >> $tableName.md
	   ((j++))
	done
	CRUD
}
