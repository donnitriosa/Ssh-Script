#!/bin/bash -e
# SSH Script
# Create By Donni Triosa (donni.triosa94@gmail.com)

#validate params
if [[ $# -lt 1 ]]
then
  echo "++===============================++"
  echo "|| Parameter Required            ||"
  echo "++===============================++"
  exit 1
fi

main=$1
# Directory containing the files
directory=/path/to/your/ssh-script-directory"
found=false

# Loop through all files in the directory
for file in "$directory"/*
do
  # Check if it's a file
  if [[ -f $file ]]
  then
    # Print the file name without the path
    filename=$(basename "$file")

    # Check if the parameter matches the file name
    if [[ $main == ${filename%.*} ]]
    then
      found=true
      break
    fi
  fi
done

# if found, execute the script
clear
if [[ $found == true ]]
then
  awk '/^$/ {exit} 1' /Volumes/Data_Drive_HD/Code/Shell/ssh-script/${main}.txt
  line=$(awk '/^$/ {exit} {print NR}' /Volumes/Data_Drive_HD/Code/Shell/ssh-script/${main}.txt | tail -n 1)
  let menu=$line-2

  read -p "Enter your choice: " server

  if [[ $server -gt 0 && $server -lt $menu ]]
  then
    let server=$server+1+$line
    # Get the command from the specific line
    command=$(sed -n "${server}p" /Volumes/Data_Drive_HD/Code/Shell/ssh-script/${main}.txt)
    
    # Execute the command
    clear
    echo $command
    eval "ssh $command"
  else
    echo "Invalid input!"
    exit 1
  fi
else
  echo "++===============================++"
  echo "|| CSP NOT FOUND                 ||"
  echo "++===============================++"
  exit 1
fi
exit 0