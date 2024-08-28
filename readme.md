# SSH Script

This is a Bash script to automate SSH connections based on predefined commands stored in text files.

## Overview

The script allows you to select and execute SSH commands from a predefined list stored in text files. Each text file contains a list of SSH commands, and the script will prompt you to choose which command to execute.

## Prerequisites

- Bash
- SSH

## Setup

1. **Modify the Directory Path**: Open the script file `myssh.sh` and change the `directory` variable to the path where your command files are stored. For example:

	```shell
	# Directory containing the files
	directory="/path/to/your/ssh-script-directory"
	```
	Replace `/path/to/your/ssh-script-directory` with the actual path to your directory.

## Usage
1.  **Place your command files**: Create text files in the specified directory. Each file should contain SSH commands, one per line.
2.  **Run the script**: Execute the script with the name of the command file (without the  `.txt`  extension) as a parameter.
	```
	./myssh.sh <command_file_name>
	```
### Example
If you have a file named  `example.txt`  in your specified 	directory, run the script as follows:
```
./myssh.sh  example
```
	
### Script Details
-   The script validates that a parameter is provided.
-   It searches for a file in the specified directory that matches the provided parameter.
-   If the file is found, it displays the content up to the first empty line.
-   It prompts the user to enter a choice.
-   Based on the user's choice, it executes the corresponding SSH command from the file.

### Error Handling

-   If no parameter is provided, the script exits with a message indicating that a parameter is required.
-   If the specified file is not found, the script exits with a message indicating that the file was not found.
-   If the user enters an invalid choice, the script exits with a message indicating invalid input.

## Example Command File
Here is an example of what a command file (`example.txt`) might look like:
```txt
# Server List
server1 user@192.168.1.1
server2 user@192.168.1.2

# Commands
ssh user@192.168.1.1
ssh user@192.168.1.2
```
In this example, the script will display the server list and prompt the user to choose a server. Based on the user's choice, it will execute the corresponding SSH command.

## Author
Created by Donni Triosa (donni.triosa94@gmail.com)