#!/bin/bash


createTable()
{
	echo "Enter table name"
	while true
	do
		read tableName
	  	if [ -n "$tableName" ]
	  	then
			if [ -f "$tableName" ]
			then 
				echo "table already exisit"
			elif [[ $tableName =~ $varchar ]]
			then	
				touch $tableName
				touch $tableName.md
				echo "Table Created Successfully"
				break;
			else
				echo "enter String table name"
			fi
	  	else 
			echo "Name entered is not valid"
	  	fi
	done


	
	names=() 
	while true
	do
		echo "Enter number of columns"
		read col_num
		if [[ $col_num =~ $num && $col_num -gt 0 ]]
		then
			while true
			do 
				while true
				do
					echo "Enter PK Col Name"
					read colName
					if [[ $colName =~ $varchar ]]
					then	
						names[0]=$colName
						break
					else
						echo "enter Valid Name"
					fi	
				done
				while true
				do
					echo "Enter PK Col DataType [num || varchar]"
					read colDataT		
					if [ -n "$colDataT" ]
					then
						if [[ "$colDataT" == "num" || "$colDataT" == "varchar" ]]
						then
							break
						else
							echo "Invalid Data Type" 
						fi
					else
						echo "enter Valid Data Type"
					fi
				done	
				echo "$colName--$colDataT--1" >> $tableName.md
				break
			done 
			j=1
			while ((j<$col_num))
			do
				while true
				do
					echo "Enter Col Name"
					read colName
					if [[ $colName =~ $varchar ]]
					then
						idx=0
						for i in "${names[@]}"
						do
							if [ "$colName" == "$i" ]
							then 
								idx=1
								break
							fi
						done
						if [ $idx -eq 0 ]
						then
							names[j]=$colName
							break
						else 
							echo "column name already exsits enter valid name"
						fi
					else
						echo "enter Valid Name"
					fi
				done
				while true
				do
					echo "Enter Col DataType"
					read colDataT
					if [ -n "$colDataT" ]
					then
						if [[ "$colDataT" == "num" || "$colDataT" == "varchar" ]]
						then
							break
						else
							echo "Invalid Data Type" 
						fi
					else
						echo "enter Valid Data Type"
					fi
				done
				echo "$colName--$colDataT--0" >> $tableName.md
				((j++))
			done
			break;
		else 
			echo "Enter Valid Number of Columns"
		fi
	done
	CRUD
}
