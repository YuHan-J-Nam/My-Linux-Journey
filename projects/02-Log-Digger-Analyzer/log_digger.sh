#!/bin/bash

# Default values for arguments
COLUMN=1
N_TOP_LINES=""
N_BOTTOM_LINES=""

# Use the getops loop to handle flags
while getopts ":c:h:t:" opt; do  # colon after a letter means flag requires an arugment, first colon is for silent error handling
	case $opt in
		c)
			COLUMN="$OPTARG"
			;;
		h)
			N_TOP_LINES="$OPTARG"
			;;
		t)
			N_BOTTOM_LINES="$OPTARG"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2  # Redirect output to stderr
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done

shift $((OPTIND-1))  # Remove flag options and treat remaining arguments

# Set filename
FILENAME="$1"

# Check if file exists
if [ -r $FILENAME ]; then  # Test operator to see if file exists and is readable
	echo "File exists"
else
	echo "File does not exist"
	exit 1  # Exit script if file is bad
fi

# Check that both -t and -h flags are not used concurrently
if [ -n "$N_TOP_LINES" ] && [ -n "$N_BOTTOM_LINES" ]; then
	echo "Cannot accept both -h and -t flags"
	exit 1
fi

# Print the specified lines from the file
SORTED=$(awk '{print $COLUMN}' $FILENAME | sort | uniq -c | sort -nr )

if [ -n "$N_TOP_LINES" ]; then
	echo SORTED | head -$N_TOP_LINES
else [ -n "$N_BOTTOM_LINES" ]; then
	echo SORTED | tail -$N_BOTTOM_LINES
else; then
	echo SORTED
fi
 
