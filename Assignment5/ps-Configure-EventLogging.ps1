'''
.DESCRIPTION
Ezra Padgett 10/29/2024
ISS 212 - CS Scripting - PowerShell Script: ps-Configure-EventLogging.ps1
Citations:

.PURPOSE
PowerShell script that enables PowerShell Logging.

.USAGE
run script from file with command or from terminal. | .\ps-Configure-EventLogging.ps1
'''

# Defines path to log folder and log file
$logFolderPath = "C:\Users\ezrap\Desktop\iss212\classfiles\WK6-LogFiles"
$logFilePath = Join-Path -Path $logFolderPath -ChildPath "PowerShellEvents.log"

# Outputs the folder and file path
Write-Host "Log folder path: $logFolderPath"
Write-Host "Log file path: $logFilePath"

# Checks if log folder exists and creates one if not
if (-not (Test-Path -Path $logFolderPath -PathType Container)) {
    Write-Host "Logs folder does not exist. Creating..."
    try {
        New-Item -Path $logFolderPath -ItemType Directory
        Write-Host "Logs folder created successfully."
    } catch {
        Write-Host "Error creating Logs folder: $_"
        exit
    }
} else {
    Write-Host "Logs folder already exists."
}

# Defines the registry path and checks if the registry key exists and creats one if not
$regPath = "HKLM:\SOFTWARE\Microsoft\PowerShell\ScriptBlockLogging"
Write-Host "Registry path: $regPath"
if (-not (Test-Path -Path $regPath)) {
    Write-Host "Registry key does not exist. Creating..."
    try {
        New-Item -Path $regPath -Force
        Write-Host "Registry key created successfully."
    } catch {
        Write-Host "Error creating registry key: $_"
        exit
    }
} else {
    Write-Host "Registry key already exists."
}

# Configures Powershell event logging
try {
    Set-ItemProperty -Path $regPath -Name "EnableScriptBlockLogging" -Value 1 -ErrorAction Stop
    Set-ItemProperty -Path $regPath -Name "LogPath" -Value $logFilePath -ErrorAction Stop
    Write-Host "PowerShell event logging has been configured. Events will be logged to $logFilePath."
} catch {
    Write-Host "Error setting registry values: $_"
}

# function to Log events with a timestamp
function Log-Event {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    # # Gets the current timestamp
    $Timestamp = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $MessageWithTimestamp = "$Timestamp - $Message"

    # # Appends the timestamp to the log file
    $MessageWithTimestamp | Out-File -FilePath $logFilePath -Append
}

# Logs start of the script
Log-Event "Script started"

# retrives system info and Logs it
try {
    $systemInfo = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture
    Log-Event "System information:"
    Log-Event $systemInfo | Out-String
} catch {
    Log-Event "Error retrieving system information: $_"
}

Write-Host "Script execution complete. Please check the log file for details: $logFilePath"
