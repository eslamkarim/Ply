#!/bin/bash

list(){
    databases= ls /usr/ply
    for db in $databases
    echo "$db"
    do
        for table in "$db"/*
        do
            echo "$table"
        done
        echo "=============================================="
    done
}