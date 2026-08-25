import sys
list = []
while True:
    line = input()
    if line == "END" :
        break
    output = ''
    for letters in line.strip():
        if letters not in "1234567890":
            output= output + letters

    list.append(output)


for string in list:
    print(string)