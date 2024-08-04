#!/bin/bash

encrypt_file(){
  FILE=$(zenity --file-selection --title="Select the file to encrypt")
  
  if [ -z "$FILE"  ]; then
   zenity --error --text="No file selected"
   exit 1
  fi
  
  Op_file=$(zenity --file-selection --save --confirm-overwrite --title="Save Encrypted as:")
  
  if [ -z "$Op_file" ]; then
   zenity --error --text="File Not Selected"
   exit 1
  fi
  
  passwd=$(zenity --password --title="Enter Encryption Password")
  
  if [ -z "$passwd" ]; then
    zenity --error --text="No password entered"
    exit 1
  fi
  
  openssl enc -des-ede3-cbc -salt -in "$FILE" -out "$Op_file" -pass pass:"$passwd"
  
  if [ $? -eq 0 ]; then
    zenity --info --text="File Encryption Successful"
    
  else
    zenity --error --text="Encryption Failed"
    
  fi
      
}

decrypt_file(){
       FILE=$(zenity --file-selection --title="Select a file to decrypt")
       
       if [ -z "$FILE" ]; then
        zenity --error --text="No file selected"
        exit 1
       fi
       
   Op_file=$(zenity --file-selection --save --confirm-overwrite --title="Save decrypted as:")
  
  if [ -z "$Op_file" ]; then
   zenity --error --text="File Not Selected"
   exit 1
  fi
  
  passwd=$(zenity --password --title="Enter Password to Decrypt")
  
  if [ -z "$passwd" ]; then
    zenity --error --text="No password entered"
    exit 1
  fi
  
  openssl enc -d -des-ede3-cbc -in "$FILE" -out "$Op_file" -pass pass:"$passwd"
  
  if [ $? -eq 0 ]; then
   zenity --info --text="File Decrypted Successful"
  
  else
   zenity --error --text="Decryption Failed"
  fi
     
}


ACTION=$(zenity --list --radiolist --column "Select" --column "Action" TRUE "Encrypt" FALSE "Decrypt" --title="Choose Action")

case $ACTION in
  Encrypt)
  encrypt_file
  ;;
  
  Decrypt)
  decrypt_file
  ;;
  *)
  zenity --error --text="No valid operation chosen"
  exit 1
  ;;
  
esac
