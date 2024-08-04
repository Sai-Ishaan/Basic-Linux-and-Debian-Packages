#!/usr/bin/bash

flag=true
echo "Date: $(date)"
pid=$!

read -p "Enter your Register Number: " regno
read -p "Enter your name: " name
read -p "Enter your email_id: " email_id

echo "Printing user details..."
sleep 3
echo "****"
sleep 2
echo "*********"
sleep 2
echo "************"
sleep 1

echo "   ****User Details**** "
echo "*******************************************************"

echo "Name: $name"
sleep 1
echo "Distros UserName: $(whoami)"
sleep 1
echo "RegNo: $regno"
sleep 1

# Regular expression for email username verification
regex="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

if [[ $email_id =~ $regex ]]; then
    echo "Email: $email_id"
else
    echo "Error: Invalid email address"
fi

echo "*********************************************************"

read -p "Would you like to exit? (y/n): " ch

if [[ $ch =~ ^[Yy]$ ]]; then
    echo "Exiting..."
    exit 0
fi
