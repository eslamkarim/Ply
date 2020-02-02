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
		read input
			
		while true
		do
		if [ -n "$input" ]
		then
			if [ "$i" -eq "0" ]	
			then
			   while true
		           do	
				value=`awk -F" " -v key=$input '{
     	  	 			if ($1 == key)
		        		print "found";
        				else print "notFound"}' /usr/ply/$currentDb/$tName`
				if [ "$value" == "notFound" ]
				then
					break
				else
					echo "this column must be unique enter valid data"
					read input
				fi 
			   done
			fi

			if [ "${colDType[i]}" == "num" ]
			then
			   while true
		           do			
				if [[ $input =~ $num ]]
				then	
					row[i]=$input
					break;
				else
					echo "Invalid Data Type" 
					read input
				fi
			   done	
			fi

			if [ "${colDType[i]}" == "varchar" ]
			then
			   while true
		           do			
				if [[ $input =~ $varchar ]]
				then	
					row[i]=$input
					break;
				else
					echo "Invalid Data Type" 
					read input
				fi
			   done	
			fi
			break;
		else 
			echo "Name Entered is not Valid"
			read input
	  	fi
		done
	((i++))		
	done

	echo "${row[*]}" >>  /usr/ply/$currentDb/$tName
	echo "Do you want enter new row (y/n)?"
	read ans
	if [[ "$ans" = "n" ]] || [[ "$ans" = "N" ]]
	then
		CRUD
        fi 
	done
}

