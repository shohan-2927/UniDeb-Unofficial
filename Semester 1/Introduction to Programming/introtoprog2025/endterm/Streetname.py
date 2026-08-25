import sys
streets = {}
with open(sys.argv[1]) as file:
    for line in file:
        data = line.strip('\n').split(';')
        city_name = data[0] # refers to all cities
        street_name = data[1]
        street_length = float(data[2])
        if city_name in streets:
            streets[city_name] += street_length  #for total length
        else:
            streets[city_name] = street_length

for (key,value) in sorted(streets.items(), key=lambda x: (-x[1], x[0])):# x[1] i value, x[0] is key
    print(key)


# to run the code, simply add the streetname.txt file to the configurations settings by going to "Run with parameters" and put the name of the txt file in
# then run as normal

