# Ezra Padgett - ISS212 - Assignment 3
# Resources: ISS212 Week 4 Assignment 3 Walkthrough

#user inputs annual data usage
data = float(input("Enter annual data usage in MB: "))
#if usage is less then 85528
if data <= 85528:
    #tax calculation
    tax = (data * 0.18) - 556
#if false
else:
    #tax calculation
    tax = 14839 + 0.32 * (data - 85528)

#if tax is less than zero it is set to zero
if tax < 0:
    tax = 0

print(f"Your Data Security Tax is: {round(tax)} MB")
