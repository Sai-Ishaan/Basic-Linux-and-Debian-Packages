#!/bin/bash
FILE=$(zenity --file-selection --title="Select a file to Shred Securely")

if [ -z "$FILE" ]; then
err=$(zenity --error --text="No file Selected.")
  exit 1
fi

ques=$(zenity --question --text="Are you sure you want to securely delete $FILE ?")
if [ $? -ne 0 ]; then
  exit 1
fi
  
shred -u "$FILE"

if [ $? -eq 0 ]; then
msg=$(zenity --info --text="File Deleted Securely")
else
error=$(zenity --error --text="Failed to Delete the file")
fi  
