import sys

device = {}
with open(sys.argv[1]) as file:
    for line in file:
        data = line.strip("\n").split(";")
        brand = data[1]
        price = int(data[3])
        if brand in device:
            device[brand]  += price
        else:
            device[brand] = price



for (key, value) in sorted(device.items(), key=lambda x: (-x[1], x[0])): # x[1] is value, x[0] is key, we sort by value first so we put it first, and then the key second, order is important
    print(f"{key} ({value})")

# to run the code, simply add the devices.txt file to the configurations settings by going to "Run with parameters" and put the name of the txt file in
# then run as normal