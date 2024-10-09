#! C:\Program Files\Git\bin\sh.exe

# Ezra Padgett - ISS212 - Assignment 3
# Resources: ISS212 Week 4 Assignment 3 Walkthrough

#1. Takes User input and checks if value is above 100

read -p "Enter the packet size in bytes: " packet
if [ "$packet" -ge 1337 ]; then
  echo "True"
else
  echo "False"
fi

#2. Takes user input and validates based on string comparison

read -p "Enter the protocol name: " protocol
if [ "$protocol" == "Cyphersec" ]; then
  echo "Cyphersec is the only supported protocol!"
elif [ "$protocol" == "cybersec" ]; then
  echo "DENIED. Cyphersec protocol only"
else
  echo "Cyphersec! Not $protocol!"
fi

#3. # Takes user input and calculates Data Security Tax based on data usage

read -p "Enter annual data usage in MB: " data
if [ "$data" -le 85528 ]; then
  tax=$((data * 18/100 - 556))
else
  tax=$((14839 + (data-85528) * 32/100))
  fi
  if [ "$tax" -lt 0 ]; then
    tax=0
  fi
  echo "Your Data Security Tax is: $tax MB"

#4. Determines if user input year falls under Patch year or Standard year

read -p "Enter the year to check the patch cycle: " year
if [ "$year" -lt 2019 ]; then
  echo "Not within the patch period"
else
  if (( year % 4 != 0 )); then
    echo "Standard year"
  elif (( year % 100 != 0 )); then
    echo "Patch year"
  elif (( year % 400 != 0 )); then
    echo "Standard year"
  else
    echo "Patch year"
  fi
fi




