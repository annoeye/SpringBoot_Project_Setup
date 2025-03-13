# Running Spring Boot Setup Scripts

This guide explains how to run the provided batch scripts to set up a Spring Boot project using both **CMD (Command Prompt)** and **Terminal (PowerShell/Git Bash)**.

## Prerequisites
- Windows OS
- Installed **Java 17+**
- Installed **Maven** (if not using the Maven Wrapper)
- Installed **Git Bash** (optional, for Terminal usage)

## Running in CMD (Command Prompt)
1. **Open CMD**: Press `Win + R`, type `cmd`, and press `Enter`.
2. **Navigate to the directory containing the script**:
   ```sh
   cd C:\path\to\your\scripts
   ```
3. **Run the script for CMD**:
   ```sh
   setup_SpingBoot_by_Cmd.bat
   ```
4. The script will:
   - Download the Spring Boot project from Spring Initializr.
   - Extract the ZIP file.
   - Run the application using Maven.

## Running in Terminal (PowerShell/Git Bash)
1. **Open Terminal (PowerShell or Git Bash)**:
   - **PowerShell**: Press `Win + X`, then select `Windows Terminal (PowerShell)`.
   - **Git Bash**: Open from the Start menu or right-click inside the folder and select **Git Bash Here**.
2. **Navigate to the script directory**:
   ```sh
   cd /c/path/to/your/scripts
   ```
3. **Run the script for Terminal**:
   ```sh
   ./setup_SpringBoot_by_Terminal.bat
   ```
4. The script will perform the same setup process as in CMD.

## Troubleshooting
- **Command Not Found:** Ensure the script is in the correct directory by running `dir` (CMD) or `ls` (Terminal).
- **Execution Policy Blocked (PowerShell Only)**:
  ```sh
  Set-ExecutionPolicy Unrestricted -Scope Process -Force
  ```
- **ZIP Extraction Issues:** Make sure PowerShell supports `Expand-Archive`, or install a tool like `7-Zip`.

## Notes
- The script may require administrative privileges.
- If the script fails due to missing dependencies, install Java and Maven manually.

**Happy coding! 🚀**
