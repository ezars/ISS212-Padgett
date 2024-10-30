# Ezra  Padgett - ISS212 - 10/29/2024
# Resources: Week 6 - Tool Development 4 Walkthrough


import re

#Loads log file
with open("auth.log", "r") as file:
    data = file.read()

#Regex pattern for failed ip
pattern = r"Failed password .* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"

#Find all Failed ips
failed_attempts = re.findall(pattern, data)

#get unique ips
ip = set(failed_attempts)

#displays ips
for i in ip:
    print(i)