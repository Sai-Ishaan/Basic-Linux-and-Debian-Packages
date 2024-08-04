#!/bin/bash

attempts=0
expected_pwd="your_expected_password"

while [ $attempts -lt 10 ]; do
    user_password=$(zenity --password --title="Enter Your Password" --text="Enter your password:")
    if [ "$user_password" == "$expected_pwd" ]; then
        zenity --info --title="Password Accepted" --text="Password accepted. You are logged in." --timeout=3
        ch=$(zenity --entry --title="Select Information" --text="Select the information you want to display (1-11):\n\n1) Currently logged in users\n2) Shell Directory\n3) Home Directory\n4) OS name and Version\n5) Current working directory\n6) Display available shells\n7) Hard Disk Information\n8) CPU Information\n9) Memory Information\n10) Currently running process\n11) EXIT")
        
        case "$ch" in
            1)
                zenity --info --title="Currently Logged-in Users" --text="Currently Logged-in Users:\n$(w)"
                ;;
            2)
                basedir=$(dirname $0)
                zenity --info --title="Shell Script Directory" --text="Shell Script Directory:\n$basedir"
                ;;
            3)
                zenity --info --title="Home Directory" --text="Your home directory:\n$HOME"
                ;;
            4)
                os_name=$(uname -s)
                os_version=$(lsb_release -sr)
                zenity --info --title="OS Information" --text="OS Name: $os_name\nOperating System Version: $os_version"
                ;;
            5)
                cwd=$(pwd)
                zenity --info --title="Current Working Directory" --text="Current Working Directory:\n$cwd"
                ;;
            6)
                shells=$(chsh -l)
                zenity --info --title="Available Shells" --text="Available Shells:\n$shells"
                ;;
            7)
                disk_space=$(df -h)
                zenity --info --title="Disk Space Usage" --text="Disk Space Usage:\n$disk_space"
                ;;
            8)
                cpu_info=$(cat /proc/cpuinfo)
                zenity --info --title="CPU Information" --text-info --filename=<(echo "$cpu_info")
                ;;
            9)
                mem_info=$(cat /proc/meminfo)
                zenity --info --title="Memory Information" --text-info --filename=<(echo "$mem_info")
                ;;
            10)
                processes=$(ps -aux)
                zenity --info --title="Currently Running Processes" --text-info --filename=<(echo "$processes")
                ;;
            11)
                zenity --info --title="Exiting" --text="Exiting..."
                break
                ;;
            *)
                zenity --info --title="Exiting" --text="Exiting..."
                break
                ;;
        esac
    else
        zenity --error --title="Invalid Password" --text="Invalid password. Please try again." --timeout=3
        ((attempts++))
    fi
done

# If all 10 attempts fail, display a message and exit
if [ $attempts -eq 10 ]; then
    zenity --info --title="All Login Attempts Failed" --text="All login attempts failed. Exiting." --timeout=4
fi

