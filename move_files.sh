#! /bin/bash

# this is an example code that moves some .py files into another python directory
filepath=/home/bishnu/practice
new_directory=python

if [[ ! -d $filepath/$new_directory ]]; then
    mkdir $filepath/$new_directory
fi

items=$(ls $filepath);

check_regex() {
    string="$1"
    pattern="$2"

    if [[ $string =~ $pattern ]]; then
	return 0
    else
	return 1
    fi
}

for file in $items; do
   # check_regex $file "\.py$"
   # if [[ $? -eq 0 ]]; then
   if check_regex "$file" "\.py$"; then
       mv $filepath/$file $filepath/$new_directory/$file
   else
       continue
   fi
done
