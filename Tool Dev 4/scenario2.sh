#!C:\Program Files\Git\bin\sh.exe

# Ezra  Padgett - ISS212 - 10/29/2024
# Resources: Week 6 - Tool Development 4 Walkthrough

# redacts ip addresses in access.log and saves to new log
sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[REDACTED]/g' access.log > access_redacted.log
echo "Redacted IP addresses and saved as access_redacted.log"