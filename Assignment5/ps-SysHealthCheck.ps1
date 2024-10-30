'''
.DESCRIPTION
Ezra Padgett 10/29/2024
ISS 212 - CS Scripting - PowerShell Script: ps-SysHealthCheck.ps1
Citations:

.PURPOSE
PowerShell script that enables PowerShell Event, Module, and Script Block Logging.

.USAGE
Run script from file with command or from terminal. | .\ps-SysHealthCheck.ps1
'''

Write-Host "System Health Check:"
Write-Host "---------------------"

# Gets disk space and calculated avialbe and remaining
try {
    $disk = Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DeviceID -eq "C:"}
    if ($disk) {
        Write-Host "Disk Space Usage: $($disk.FreeSpace / 1GB)GB free of $($disk.Size / 1GB)GB ($([math]::Round($disk.FreeSpace / $disk.Size * 100, 2))% free)"
    } else {
        Write-Host "Could not retrieve disk space information."
    }
} catch {
    Write-Host "Error retrieving disk space information: $_"
}

Write-Host "---------------------"

#  gets CPU usage and displays it
Write-Host "CPU Usage:"
try {
    Get-CimInstance Win32_Processor | ForEach-Object { Write-Host "CPU Load: $($_.LoadPercentage)%"; }
} catch {
    Write-Host "Error retrieving CPU usage information: $_"
}

Write-Host "---------------------"

# Gets total memory usage and how much is available
Write-Host "Memory Usage:"
try {
    $memory = Get-CimInstance Win32_OperatingSystem
    if ($memory) {
        $usedMemory = ($memory.TotalVisibleMemorySize - $memory.FreePhysicalMemory) / 1MB
        $totalMemory = $memory.TotalVisibleMemorySize / 1MB
        Write-Host "Used Memory: $([math]::Round($usedMemory, 2))MB of $([math]::Round($totalMemory, 2))MB"
    } else {
        Write-Host "Could not retrieve memory usage information."
    }
} catch {
    Write-Host "Error retrieving memory usage information: $_"
}

Write-Host "---------------------"

# gets operating system information and displays it
Write-Host "Operating System Information:"
try {
    $os = Get-CimInstance Win32_OperatingSystem
    if ($os) {
        Write-Host "OS Name: $($os.Caption)"
        Write-Host "Version: $($os.Version)"
        Write-Host "Architecture: $($os.OSArchitecture)"
    } else {
        Write-Host "Could not retrieve operating system information."
    }
} catch {
    Write-Host "Error retrieving operating system information: $_"
}
