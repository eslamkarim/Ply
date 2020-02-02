#!/bin/bash
. ./metadata.sh

update(){
    clear
    while true 
	do
		echo "Please enter the table you want to Update";
        read table_name
    		if [ -f "/usr/ply/$currentDb/$table_name" ]
    		then
        		break;
    		else
        		echo "There's no table with name $table_name"
    		fi
	done
    while true
    do
        echo "enter Column to update"
        read col_name
        col_number=$(awk -F"--" -v col=$col_name '{
            if ($1 == col)
                print NR;
            }' /usr/ply/$currentDb/$table_name.md)
        if [ -n "$col_number" ]
        then
            while true
            do
                echo "enter the id to update"
                read id
                id_check=$(awk -F'[ ]' -v id=$id '{
                            if ($1 == id){
                                print $0;
                            }
                            }' /usr/ply/$currentDb/$table_name)
                if [ -n "$id_check" ]
                then
                data_type=$(awk -F"--" -v col=$col_name '{
                if ($1 == col)
                    print $2;
                }' /usr/ply/$currentDb/$table_name.md)
                break
                fi
            done
            echo "insert update"
            while true
            do	
                read upd	
                if [ "$data_type" == "num" ]
                then		
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
                    fi
                elif [ "$data_type" == "varchar" ]
                then		
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
                    fi
                fi
            done
        else
            echo "wrong column"
        fi
    done
}