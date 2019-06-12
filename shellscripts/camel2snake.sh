#! /bin/bash

for file in ./*
do
    new_name=$(echo $file | sed -r 's/([a-z0-9])([A-Z])/\1_\L\2/g')
    mv $file $new_name
done