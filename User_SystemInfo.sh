#!/usr/bin/bash

attempts=0
expected_pwd="zedd" #Users can change the password to their convenience or link their Linux User passwd (( $passwd ))

while [ $attempts -lt 10 ]; do
   read -s- -p "Enter your password: " user_password
   echo
  if [ "$user_password" == "$expected_pwd" ]; then
     sleep 2
     echo "Password accepted. You are logged in."
     sleep 3
     echo -e "\n\t\t ****************SYSTEM-USER INFORMATION****************"
     sleep 2
        echo -e "\t\t***`sleep 2`*****`sleep 2`*********************`sleep 2`**************************"
        sleep 2
        echo -e "Available Operations:  \n1)Currently logged in users  \n2)Shell Directory  \n3)Home Directory \n4)OS name and Version  \n5)Current working directory  \n6)Display available shells  \n7)Hard Disk Information \n8)CPU Information \n9) Memory Information \n10) Currently running process \n 11)EXIT"
        sleep 2
        read -p"Enter the S.NO of the information you want to display: " ch
        
        if (( ch == 1 )); then
           echo -e "Currently Logged-in Users: \n "
           w
        
        elif (( ch == 2 )); then
           basedir=$(dirname $0)
           echo -e "Shell Script Directory:  ${basedir}"
           
        elif (( ch == 3 )); then
           echo "Your home directory: $HOME"
           
        elif (( ch == 4 )); then
           echo "OS Name: $(uname -s)"
           echo "Operating System Version: $(lsb_release -sr)"

        elif (( ch == 5 )); then
           echo "Current Working Directory: $(pwd)"
           
        elif (( ch == 6 )); then
           echo "Available Shells: "
           chsh -l
        elif (( ch == 7 )); then
           echo "Disk Space usage: "
           df -h

        elif (( ch == 8 )); then
           echo "CPU information: "
           cat /proc/cpuinfo | more
           
        elif (( ch == 9 )); then
           echo "Memory Information: "
           cat /proc/meminfo | more
           
         elif (( ch == 10 )); then
           echo "Currently running process: "
           ps -aux | more
           
         else 
           sleep 2
           echo "Exiting..."
           sleep 1
           break    
        fi
        
    else
        sleep 3
        echo "Invalid password. Please try again."
        ((attempts++))
    fi
done
 # If all 10 attempts fail, display a message and exit
if [ $attempts -eq 10 ]; then
    sleep 4
    echo "All login attempts failed. Exiting."
fi

#Remember to change passwd to your convenince and change the permission according to your likness

#In this example I've given Read, Write and Execute permssion to user, Read and Execution permission to Group and no permission for others

#chmod 750 User_Info.sh -> Octal form
#or 
#chmod u=rwx,g=rx,o= User_Info.sh       
    

