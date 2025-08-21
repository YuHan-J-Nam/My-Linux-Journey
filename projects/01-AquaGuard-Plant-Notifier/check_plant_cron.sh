#!/bin/bash

# --- Configuration ---
# Set how many days to wait before sending a reminder.
days_to_wait=14

# --- Logic ---
# Get the current time in seconds (Unix timestamp)
current_date=$(date +%s)

# Read the last watering time from log file
last_watered_date_string=$(tail -n 1 watering_log.txt)
last_watered_date=$(date -d "$last_watered_date_string" +%s) # Convert into Unix timestamp

# Calculate the difference in seconds
seconds_passed=$((current_date - last_watered_date))

# Convert the seconds in to days
days_passed=$((seconds_passed / 60 / 60 / 24))

# --- Status Report  ---
# Check if the days passed is GREATER THAN OR EQUAL TO (-ge) the days to wait.
if [ $days_passed -ge $days_to_wait ]; then
	echo "Your plant needs water! It has been $days_passed days."
else
	days_remaining=$((days_to_wait - days_passed))
	echo "The plant is fine. You still have $days_remaining day(s) before you have to water the plant."
fi
