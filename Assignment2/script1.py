# Ezra Padgett - ISS 212 - Assignment 2

def read(readfile):
    #reads file and returns the data
    with open(readfile, 'r') as file:
        return file.readlines()

def logfilter(lines):
    data = []
    sort = input("Pick one: [1]Failed root login, [2]Suspicious activity detected, [3]Failed login, [4]ALL:")
    if sort == "1":
        for i in lines:
            if "Failed root login" in i:
                data.append(i)
    elif sort == "2":
        for i in lines:
            if "Suspicious activity detected" in i:
                data.append(i)
    elif sort == "3":
        for i in lines:
            if "Failed login" in i:
                data.append(i)
    else:
        for i in lines:
            if "Failed root login" in i or "Suspicious activity detected" in i or "Failed login" in i:
                data.append(i)
    return data


if __name__ == "__main__":
    log = read("access.log")
    threats = logfilter(log)
    #displays suspicious liness
    for j in threats:
        print(j)

