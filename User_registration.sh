#!/bin/bash

echo -e "\nWelcome to User Registration"
echo -e "This program ensures all the validations are in place during the User Entry"

#Function to check if the name starts with caps and has min 3 characters
function check_name() {

	#Pattern to check if first letter is uppercase and has a min of 3 characters
	pat="^[[:upper:]]{1}[[:lower:]]{2,}$"

	#Checking if name matches the pattern
	if [[ $1 =~ $pat ]]
	then
		echo -e "\nThe name is valid"
		((count++))
	else
		echo -e "\nThe name is invalid"
	fi

}


#Variable
count=0

while [[ $count -eq 0 ]]
do

	echo -e "\nEnter your first name"
	read first_name

	check_name $first_name
done

count=0

while [[ $count -eq 0 ]]
do
	echo -e "\nEnter your last name"
	read last_name

	check_name $last_name
done

count=0

while [[ $count -eq 0 ]]
do
	#Checking email
	echo -e "\nEnter your email id"
	read email

	#Pattern check for email
	email_pat="^[[:lower:]]{1,}[._+\-]{0,1}[[:lower:]0-9]{1,}\@[[:lower:]0-9]{1,}[\.]{1}[[:lower:]]{2,}([.]{0,}[[:lower:]]{2,})?$"

	if [[ $email =~ $email_pat ]]
	then
		echo -e "\nValid Email"
		((count++))
	else
		echo -e "\nInvalid Email"
	fi
done

count=0
while [[ $count -eq 0 ]]
do
	#Checking Mobile Number
	echo -e "\nEnter your mobile number as follows country code(91) space 10-digit number(1234567891)"
	read mob_num

	pat="^91 [6-9]{1}[0-9]{9}$"

	if [[ $mob_num =~ $pat ]]
	then
		echo -e "\nValid mobile number"
		((count++))
	else
		echo -e "\nInvalid mobile number"
	fi
done

count=0

while [[ $count -eq 0 ]]
do
	#Checking condition 1, 2, 3 and 4 for password (length is more than 8, contains atleast 1 uppercase letter and 1 digit and only one special character)
	echo -e "\nEnter the password (min 8 characters, atleast 1 digit and uppercase letter and only one special character)"
	read password

	#Pattern to check if the length of the password is more than 8
	pat=".{8}"

	if [[ $password =~ $pat ]]
	then
		#Pattern checks if there is an uppercase letter present
		pat="[[:upper:]]{1,}"

		if [[ $password =~ $pat ]]
		then
			#Pattern check if there is a digit present
			pat="[0-9]{1,}"

			if [[ $password =~ $pat ]]
			then
				#Pattern checks if there is only one special character present
				pat="[!@#$%^&*()_+=]{1}"

				if [[ $password =~ $pat ]]
				then
					echo -e "\nThe password entered is valid"
					((count++))
				else
					echo -e "\nPassword doesn't contain a single special character"
				fi

			else
				echo -e "\nThe password entered does not contain a digit"
			fi

		else
			echo -e "\nThe password entered does not contain an uppercase letter"
		fi

	else
		echo -e "\nThe password entered is less than 8 characters"
	fi
done

#Checking all 22 email samples using array
#Storing sample emails in a array
a[1]="abc@yahoo.com"
a[2]="abc-100@yahoo.com"
a[3]="abc.100@yahoo.com"
a[4]="abc111@abc.com"
a[5]="abc-100@abc.net"
a[6]="abc.100@abc.com.au"
a[7]="abc@1.com"
a[8]="abc@gmail.com.com"
a[9]="abc+100@gmail.com"
a[10]="abc"
a[11]="abc@.com.ny"
a[12]="abc123@gmail.c"
a[13]="abc123@.com"
a[14]="abc123@.com.com"
a[15]=".abc@abc.com"
a[16]="abc()*@gmail.com"
a[17]="abc@%*.com"
a[18]="abc..2002@gmail.com"
a[19]="abc.@gmail.com"
a[20]="abc@abc@gmail.com"
a[21]="abc@gmail.com.1a"
a[22]="abc@gmail.com.aa.au"

echo -e "\nChecking sample emails for the validity of the pattern search"

#Variables
vcount=0
icount=0

for (( i=1 ; i<23 ; i++ ))
do
	if [[ ${a[i]} =~ $email_pat ]]
	then
		valid_email[vcount]=${a[i]}
		((vcount++))
	else
		invalid_email[icount]=${a[i]}
		((icount++))
	fi
done

echo -e "\nValid email samples are"

for (( i=0 ; i<=vcount ; i++ ))
do
	echo ${valid_email[$i]}
done

echo -e "\nInvalid email samples are"

for (( i=0 ; i<=icount ; i++ ))
do
	echo ${invalid_email[$i]}
done
