#!/bin/bash
. ./metadata.sh

update(){
    clear
    echo "enter table name to update"
    read table_name
    echo "enter Column to update"
    read col_name
    echo "enter the id to update"
    read id
    echo "insert update"
    read upd
    data_type=$(awk -F"--" -v col=$col_name '{
    if ($1 == col)
        print $2;
    }' /usr/ply/$currentDb/$table_name.md)
    col_number=$(awk -F"--" -v col=$col_name '{
        if ($1 == col)
            print NR;
        }' /usr/ply/$currentDb/$table_name.md)

    echo "data type: $data_type, col_number: $col_number"

    if [ -n "$col_number" ]
    then
        if [ "$data_type" == "num" ]
			then
			   while true
		           do			
				if [[ $upd =~ $num ]]
				then	
					new_line=$(awk -F'[ ]' -v id=$id -v val=$upd -v col=$col_number '{
                        if ($1 == id){
                            $col=val;
                            print $0;
                        }
                        }' /usr/ply/$currentDb/$table_name)
                    update_line_number=$(awk -F'[ ]' -v id=$id '{
                        if ($1 == id){
                            print NR;
                        }
                        }' /usr/ply/$currentDb/$table_name)
                        #echo "$new_line   line number = $update_line_number"
                        sed -i "$update_line_number s/.*/$new_line/" /usr/ply/$currentDb/$table_name
                        echo "update success"
                        CRUD
				else
					echo "Invalid Data Type insert $data_type value" 
					read upd
				fi
			   done
        elif [ "$data_type" == "varchar" ]
			then
			   while true
		           do			
				if [[ $upd =~ $varchar ]]
				then	
					new_line=$(awk -F'[ ]' -v id=$id -v val=$upd -v col=$col_number '{
                        if ($1 == id){
                            $col=val;
                            print $0;
                        }
                        }' /usr/ply/$currentDb/$table_name)
                    update_line_number=$(awk -F'[ ]' -v id=$id '{
                        if ($1 == id){
                            print NR;
                        }
                        }' /usr/ply/$currentDb/$table_name)
                        #echo "$new_line   line number = $update_line_number"
                        sed -i "$update_line_number s/.*/$new_line/" /usr/ply/$currentDb/$table_name
                        echo "update success"
                        CRUD
				else
					echo "Invalid Data Type insert $data_type value" 
					read upd
				fi
			   done
        fi
    else
        echo "wrong column"
    fi
}