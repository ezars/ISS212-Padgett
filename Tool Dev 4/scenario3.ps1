# Ezra  Padgett - ISS212 - 10/29/2024
# Resources: Week 6 - Tool Development 4 Walkthrough

#Loads log file
$logfile = "security.log"

#finds failed attempts
$failed_attempts = Select-String -Path $logfile -Pattern "Login attempt failed from IP (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})" -AllMatches

#Extracts ips and counts occurrences
$ips = @{}
foreach ($i in $failed_attempts){
    $ip = $i.Matches.Groups[1].Value
    if ($ips.ContainsKey($ip)){
        $ips[$ip] += 1
    } else{
        $ips[$ip] = 1
    }
}

#displays ips with more than 3 failed attempts
foreach ($ip in $ips.Keys) {
    if ($ips[$ip] -gt 3) {
        Write-Host "$ip has $($ips[$ip]) failed login attempts"
    }
}