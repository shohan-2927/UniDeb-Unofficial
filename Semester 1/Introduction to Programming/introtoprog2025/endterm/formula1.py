import sys
formula1 = {}
with open(sys.argv[1]) as file:
    for line in file:
        data = line.strip('\n').split(';')
        driver_name = data[0]
        laps = int(data[2])
        if driver_name in formula1:
            formula1[driver_name] += laps
        else:
            formula1[driver_name] = laps


for (key,value) in sorted(formula1.items(), key=lambda x:(-x[1], x[0])):
    print(key)