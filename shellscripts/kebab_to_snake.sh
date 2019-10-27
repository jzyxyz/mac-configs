#! /bin/bash

for file in ./*
do
    new_name=$(echo $file | sed 's/-/_/g')
    echo $new_name
    mv $file $new_name
done