@echo off

:: Define project details
echo Setting up Spring Boot project...
set GROUP_ID=com.example
set ARTIFACT_ID=demo
set PACKAGE_NAME=com.example.demo
set JAVA_VERSION=17
set DEPENDENCIES=web
set SPRING_BOOT_VERSION=3.4.3
set LANGUAGE=java
set TYPE=maven-project
set ZIP_FILE=starter.zip
set FOLDER_NAME=%ARTIFACT_ID%

:: Check if the folder already exists and delete it if necessary
if exist %FOLDER_NAME% (
    echo The folder %FOLDER_NAME% already exists. Deleting it...
    rmdir /s /q %FOLDER_NAME%
)

:: Download the Spring Boot project
echo Downloading Spring Boot project...
powershell -Command "Invoke-WebRequest -Uri 'https://start.spring.io/starter.zip?type=%TYPE%&groupId=%GROUP_ID%&artifactId=%ARTIFACT_ID%&name=%ARTIFACT_ID%&packageName=%PACKAGE_NAME%&javaVersion=%JAVA_VERSION%&dependencies=%DEPENDENCIES%&bootVersion=%SPRING_BOOT_VERSION%&language=%LANGUAGE%' -OutFile '%ZIP_FILE%'"

:: Verify if the downloaded file is a valid ZIP
echo Checking if the file is a valid ZIP...
findstr /M "error message" %ZIP_FILE% >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Error: The downloaded file contains an error message instead of a ZIP archive.
    type %ZIP_FILE%
    exit /b 1
)

:: Extract the ZIP file
echo Extracting project...
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%FOLDER_NAME%' -Force"

:: Check if extraction was successful
if not exist %FOLDER_NAME% (
    echo Error: Extraction failed.
    exit /b 1
)

:: Delete the ZIP file after extraction
echo Deleting ZIP file...
del %ZIP_FILE%

:: Run the Spring Boot application
echo Running Spring Boot application...
cd %FOLDER_NAME%
if exist mvnw.cmd (
    echo Using Maven Wrapper...
    call mvnw.cmd spring-boot:run
) else (
    echo Maven Wrapper not found. Using system Maven...
    mvn spring-boot:run
)

:: Done
echo Done. Project is running!
exit /b 0
