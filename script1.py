# Ezra Padgett - ISS 212 - Assignment 2

def read(file_path):
    #reads file and returns to data
    with open(file_path, 'r') as file:
        return file.readlines()

def filter(lines):
    entries = []
    #filters the file for entries and appends them to list and returns
    for line in lines:
        if "root login" in line or "Failed login" in line or "Suspicious activity" in line:
            entries.append(line)
    return entries

def results(threats):
    #displays the threats
    for threat in threats:
        print(threat)

if __name__ == "__main__":
    data = read("access.log")
    threats = filter(data)
    results(threats)