'''
.DESCRIPTION
Ezra Padgett 10/29/2024
ISS 212 - CS Scripting - PowerShell Script: ps-LogSetup.ps1
Citations:

.PURPOSE
PowerShell script that enables PowerShell Event, Module, and Script Block Logging.

.USAGE
run script from file with command or from terminal. | .\ps-LogSetup.ps1
'''

function Ensure-RegistryPath {
    param (
        [string]$Path
    )
    # checks if registry path exits and creats if not
    if (-not (Test-Path $Path)) {
        $null = New-Item -Path $Path -Force
        Write-Host "Created registry path: $Path"
    }
}

function Enable-EventLogging {
    # Enables Event Logging if the user wants to
    Write-Host "Event Logging enables the recording of PowerShell engine events."
    $userChoice = Read-Host "Do you want to enable Event Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
        Write-Host "Event Logging has been enabled."
    } else {
        Write-Host "Skipping Event Logging."
    }
}

function Enable-ModuleLogging {
    #  Enables Module Logging if user wants to
    Write-Host "Module Logging records events from PowerShell modules."
    $userChoice = Read-Host "Do you want to enable Module Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Value 1
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "ModuleNames" -Value "*"
        Write-Host "Module Logging has been enabled for all modules."
    } else {
        Write-Host "Skipping Module Logging."
    }
}

function Enable-ScriptBlockLogging {
    #  Enable script Block Logging if user wants to
    Write-Host "Script Block Logging records the content of all script blocks that are processed."
    $userChoice = Read-Host "Do you want to enable Script Block Logging? (Y/N)"
    if ($userChoice -eq 'Y') {
        Ensure-RegistryPath -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
        Write-Host "Script Block Logging has been enabled."
    } else {
        Write-Host "Skipping Script Block Logging."
    }
}

Write-Host "Welcome to the PowerShell Logging Setup Script"
Write-Host "This script will guide you through enabling various PowerShell logging features."

Enable-EventLogging
Enable-ModuleLogging
Enable-ScriptBlockLogging

Write-Host "PowerShell Logging setup is complete."
