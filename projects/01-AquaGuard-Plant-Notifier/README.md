# Project 01: AquaGuard Plant Notifier

A smart command-line tool built in Bash to ensure you never forget to water your plants. This script uses a simple log file and cron to automate daily checks.

### Features

*   **Tracks Plant Health:** Calculates and reports the number of days since the last wateing.
*   **Interactive Logging:** Provides an interactive prompt to easily log a new watering session.
*   **Historical Log:** Maintains a human-readable log file (`watering_log.txt`) with a timestamp for every watering.
*   **Automation-Ready:** Includes a separate, non-interactive script (`check_plant_cron.sh`) specifically designed for automated execution via cron.

### Key Concepts Learned

This project was a practical exercise in core Linux and DevOps fundamentals:
*   **Bash Scripting:** Using variables, conditional logic (`if/else`), and user input (`read`).
*   **File I/O:** Reading from files (`tail`) and appending output to files (`>>`).
*   **Cron Automation:** Scheduling jobs with `crontab` for unattended execution.
*   **Command-Line Mastery:** Leveraging the `date` command for complex timestamp conversion and formatting.
*   **Git & GitHub:** Practicing the full developer workflow from `git init` to `git push`.

### Getting Started

**1. Navigate to the Project Directory**
```bash
cd projects/01-AquaGuard-Plant-Notifier
```

**2. Initialize the Log File**
Create the log file with a starting date. The following command sets it to 15 days ago.
```bash
date -d "15 days ago" > watering_log.txt
```

**3. Run the Interactive Script**
Execute the script to check the status and log a new watering.
```bash
./check_plant.sh
```

### Automating with Cron

To have your system check your plant automatically every day at 9:05 AM, follow these steps:

**1. Open your crontab:**
```bash
crontab -e
```

**2. Add the following line:**
*Note: Make sure to replace `/full/path/to/your/project/` with the actual absolute path to the `check_plant_cron.sh` script.*
```
5 9 * * * /full/path/to/your/project/01-AquaGuard-Plant-Notifier/check_plant_cron.sh
```
