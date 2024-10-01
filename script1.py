# Ezra Padgett - ISS 212 - Assignment 2

def read(readfile):
    #reads file and returns the data
    with open(readfile, 'r') as file:
        return file.readlines()

def logfilter(lines):
    data = []
    #filters the file for suspicious entries and appends them to list and returns
    for i in lines:
        if "root login" in i or "Suspicious activity" in i or "Failed login" in i:
            data.append(i)
    return data


if __name__ == "__main__":
    log = read("access.log")
    threats = logfilter(log)
    #displays suspicious lines
    for j in threats:
        print(j)

