#!/bin/bash
count=0
# Create a custom Zenity dialog with specific width and height
login=$(zenity --info --width 400 --height 500 --text="\n\tThis is a Custom Zenity Dialog box to display Linux User Details. \n\tEnter Proceed to travel to the next page with User Login" --ok-label="Proceed"); echo $login

USR=$(zenity --entry --width 400 --height 200 --title "Username and password" --text "\n\tEnter username: " --ok-label="Proceed"); echo $USR


while [ count -lt 10 ]; do
   password=$(zenity --entry --width 400 --height 200 --title "Password" --text "\n\tEnter password" --hide-text); #echo $password
   if [ "$password" == "zed2408" ]; then
    accept=$(zenity --info --width 350 --height 200 --title "Accepted" --text "\n\t Welcome  user!!"); echo $accept
  
   else 
     reject=$(zenity --info --width 350 --height 200 --title "Rejected" --text "\n\t Invalid  Password! Try again..."); echo $reject

     $((count++))
   fi
done    

if [ $count -eq 10 ]; then
  fin=$(zenity --info --width 300 --height 200 --text "\n\t REJECTED"); echo $fin
  break
fi 
  
   
