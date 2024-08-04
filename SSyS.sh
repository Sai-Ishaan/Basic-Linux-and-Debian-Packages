#!/usr/bin/bash

while true; do
CHOICE=$(zenity --list --title="Seccc-Server" --column="Select an option" "Network Monitoring" "File Encrypt/Decrypt" "Secure File Deletion" "Exit")

case $CHOICE in
  "Network Monitoring")
  ./network.sh
  ;;
  
  "File Encrypt/Decrypt")
  ./file_encryption.sh
  ;;
  
  "Secure File Deletion")
  ./secure_delete.sh
  ;;
  
  "Exit")
  break
  ;;
  *)
  
  zenity --error --text="Invalid option Selected"
  ;;
  
  esac
  done
