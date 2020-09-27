#!/bin/bash

echo -e "\nWelcome to User Registration"
echo -e "This program ensures all the validations are in place during the User Entry\n"

#Function to check if the name starts with caps and has min 3 characters
function check_name() {

	#Pattern to check if first letter is uppercase and has a min of 3 characters
	pat="^[[:upper:]]{1}[[:lower:]]{2,}$"

	#Checking if name matches the pattern
	if [[ $1 =~ $pat ]]
	then
		echo -e "\nThe name is valid"
	else
		echo -e "\nThe name is invalid"
	fi

}

echo "Enter your first name"
read first_name

check_name $first_name

echo -e "\nEnter your last name"
read last_name

check_name $last_name

#Checking email
echo -e "\nEnter your email id"
read email

#Pattern check works in regix101.com but does not work in git bash
pat="^[0-9[:upper:][:lower:]]{2,}+([._+-][0-9[:upper:][:lower:]]{1,})?@[0-9[:upper:][:lower:]]{1,}+[.]{1}[[:lower:]{2,}([.]{1}[[:lower:]]{2,})?$"

if [[ $email =~ $pat ]]
then
	echo -e "\nValid Email"
else
	echo -e "\nInvalid Email"
fi

