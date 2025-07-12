# Main-Detection-Script
A bash script to orchestrate a suite of SOC detection scripts, running each script and logging alerts to a specified file.

## Usage
1. Ensure all detection scripts (`failed_login.sh`, etc.) and `config.sh` are available and in the same directory.
2. Run:
   ```bash
   sudo ./main.sh
   ```
3. Check alerts in the log file (e.g., alerts/alerts.log).

## Dependencies
- bash
- 
