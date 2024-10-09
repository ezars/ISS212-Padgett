# Ezra Padgett - ISS212 - Assignment 3
# Resources: ISS212 Week 4 Assignment 3 Walkthrough

#user inputs Year
year = int(input("Enter year: "))
#if year is below 2019 it is not witin period
if year < 2019:
    print("Not Within the managed patch period.")
else:
    #determines if user input is Standard or patch year
    if year % 4 != 0:
        print("Standard year")
    elif year % 100 != 0:
        print("Patch year")
    elif year % 400 != 0:
        print("Standard year")
    else:
        print("Patch year")
