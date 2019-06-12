#! /bin/bash



for file in ./* 
do
    if [[ $file =~ .*sh ]]
    then 
        chmod +x $file
        echo "+x for $file"
    fi
done