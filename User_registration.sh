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

#Checking Mobile Number
echo -e "\nEnter your mobile number as follows country code(91) space 10-digit number(1234567891)"
read mob_num

pat="^91 [6-9]{1}[0-9]{9}$"

if [[ $mob_num =~ $pat ]]
then
	echo -e "\nValid mobile number"
else
	echo -e "\nInvalid mobile number"
fi

#Checking condition 1 and 2 for password (length is more than 8 and contains atleast 1 uppercase letter)
echo -e "\nEnter the password (min 8 characters and atleast 1 uppercase letter)"
read password

#Pattern to check if the length of the password is more than 8
pat=".{8}"

if [[ $password =~ $pat ]]
then
	#Pattern checks if there is an uppercase letter present
	pat="[[:upper:]]{1,}"

	if [[ $password =~ $pat ]]
	then
		echo -e "\nThe password entered is valid"
	else
		echo -e "\nThe password entered does not contain an uppercase letter"
	fi

else
	echo -e "\nThe password entered is less than 8 characters"
fi
