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
- [Configuration file](https://github.com/EsosaSEC/Configuration-file)
- [Failed Login detection](https://github.com/EsosaSEC/Failed-Login-Detector)
- [Privilege Escalation](https://github.com/EsosaSEC/Privilege-Escalation-Detector)
- [Network Scanning](https://github.com/EsosaSEC/Network-Scanner)
- [Process Monitoring](https://github.com/EsosaSEC/Process-Monitor)

