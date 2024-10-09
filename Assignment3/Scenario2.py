# Ezra Padgett - ISS212 - Assignment 3
# Resources: ISS212 Week 4 Assignment 3 Walkthrough

#assign user input to protocol
protocol = input("Enter protocol: ")
#checks if user input is equal to Cyphersec
if protocol == "Cyphersec":
    #if true it prints
    print("Cyphersec is the only supported protocol!")
# if not true it checks if user input is equal to cybersec(common misspelling)
elif protocol == "cybersec":
    #if true prints
    print("DENIED. Cyphersec protocol only")
#if user input is not equal to the above
else:
    print("Cyphersec! Not", protocol)