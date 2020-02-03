#!/bin/bash
. ./metadata.sh

insertRow()
{
	tName=""
	echo "Please enter the table you want to insert into";
    	read tName
	while true 
	do
		
    		if [ -f "/usr/ply/$currentDb/$tName" ]
    		then
        		break;
    		else
        		echo "There's no table with name $tName enter valid name"
        		read tName
    		fi
	done

	numOfRows=$(cat /usr/ply/$currentDb/$tName.md | wc -l)
	colNames=($(awk 'BEGIN{FS="--"}{if(NR>0)print $1;}' /usr/ply/$currentDb/$tName.md))
	colDType=($(awk 'BEGIN{FS="--"}{if(NR>0)print $2;}' /usr/ply/$currentDb/$tName.md))
	colPK=($(awk 'BEGIN{FS="--"}{if(NR>0)print $3;}' /usr/ply/$currentDb/$tName.md))

	while true
	do
	i=0;
	row=()
	while (( i < numOfRows ))
	do 
		echo "Enter ${colNames[i]}"	
		while true
		do
			read input
			if [ -n "$input" ]
			then
				if [ "${colDType[i]}" == "num" ]
				then			
					if [[ $input =~ $num ]]
					then	
						if [ "$i" -eq "0" ]	
						then
							value=$(awk -F"[ ]" -v key=$input '{
								if ($1 == key)
								print $0;
								}' /usr/ply/$currentDb/$tName)	
							if [ -n "$value" ]
							then
								echo "this column must be unique enter valid data"
							else 
								row[i]=$input
								break;
							fi
						else 
							row[i]=$input
							break;
						fi
					else
						echo "Invalid Data Type" 
					fi	
				elif [ "${colDType[i]}" == "varchar" ]
				then			
					if [[ $input =~ $varchar ]]
					then					
						if [ "$i" -eq "0" ]	
						then
							value=$(awk -F"[ ]" -v key=$input '{
								if ($1 == key)
								print $0;
								}' /usr/ply/$currentDb/$tName)	
							if [ -n "$value" ]
							then
								echo "this column must be unique enter valid data"
							else 
								row[i]=$input
								break;
							fi
						else 
							row[i]=$input
							break;
						fi
					else
						echo "Invalid Data Type" 
					fi	
				fi
			else 
				echo "Name Entered is not Valid Enter valid column name"
			fi
		done
	((i++))		
	done

	echo "${row[*]}" >>  /usr/ply/$currentDb/$tName
	echo "Do you want enter new row (press any key to enter new row except N)?"
	read ans
	if [[ "$ans" = "n" ]] || [[ "$ans" = "N" ]]
	then
		CRUD
    fi 
	done
}

