#!/bin/bash

echo -e "\nWelcome to User Registration"
echo -e "This program ensures all the validations are in place during the User Entry\n"

echo "Enter your first name (staring with caps and having a minimum of 3 characters)"
read first_name

#Pattern to check if first letter is uppercase and has a min of 3 characters
pat="^[[:upper:]]{1}[[:lower:]]{2,}$"

#Checking if name matches the pattern
if [[ $first_name =~ $pat ]]
then
	echo -e "\nThe first name $first_name is valid"
else
	echo -e "\nThe first name $first_name is invalid"
fi
