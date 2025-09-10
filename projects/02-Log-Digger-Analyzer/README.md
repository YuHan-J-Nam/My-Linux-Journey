# Project 02: Log Digger - A Command-Line Log Analyzer

Log Digger is a flexible and powerful Bash utility designed to parse and summarize web server log files. This tool moves beyond simple scripting to function like a professional command-line application, accepting flags to control its behavior and handling errors gracefully.

### The Problem-Solving Process

The core challenge was to transform a raw, multi-gigabyte log file into a concise, actionable summary. This was accomplished by building a classic Unix pipeline, chaining together several specialized text-processing tools, each handling one part of the task:

1.  **Isolation (`awk`):** The first step was to isolate a single column of data (e.g., an IP address) from each of the thousands of lines. The `awk` utility was chosen for its ability to handle column-based data efficiently.
2.  **Counting (`sort` & `uniq -c`):** To perform a frequency count, the data was first sorted to group identical entries together, then piped into `uniq -c` to count the occurrences.
3.  **Ranking (`sort -nr`):** The final step in the pipeline was to sort the counted results numerically and in reverse order to produce a ranked list from most to least common.

### Features & Concepts Learned

This project was a significant step up in complexity, focusing on building a robust and user-friendly tool.

*   **Advanced Bash Scripting:**
    *   **Argument Parsing with `getopts`:** Implemented a professional argument parsing loop to handle flags (`-c`, `-h`, `-t`) in any order, making the tool flexible and intuitive.
    *   **Dynamic Pipeline Construction:** Used `if/elif/else` logic to dynamically add `head` or `tail` to the command pipeline based on user-provided flags.
    *   **Robust Error Handling:** The script validates user input to prevent common errors, checking for missing arguments, non-existent files, and mutually exclusive flags.

*   **Mastery of Core Linux Tools:**
    *   `awk`: Passing shell variables to `awk` with the `-v` flag for dynamic column selection.
    *   `sort`: Performing both alphabetical and numerical/reverse sorting.
    *   `uniq`: Counting unique entries.
    *   `head`/`tail`: Displaying the top or bottom results of a data set.

### How to Use

The script expects a log file and optional flags for customizing the analysis.

**Basic Usage (Find top 10 IPs from column 1):**
```bash
./log_digger.sh apache_logs -h 10```

**Advanced Usage (Find the 5 least common Response Codes from column 9):**
```bash
./log_digger.sh apache_logs -c 9 -t 5```
