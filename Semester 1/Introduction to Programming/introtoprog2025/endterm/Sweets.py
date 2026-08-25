import sys
sweets = {}

for line in sys.stdin:
    data = line.strip("\n").split(":")
    city = data[0]
    attractions = data[1]
    attractions_number = attractions.strip().split(",")
    if city not in sweets:
        sweets[city] = len(attractions_number)

for (key, value) in sorted(sweets.items(), key= lambda x: (x[1], x[0])):
    print(f"{key}: {value} attraction(s)")

# to run the code, run with no parameters and paste these in
# New York:Central Park,Statue of Liberty,Times Square
# Paris:Eiffel Tower,Louvre Museum
# Tokyo:Tokyo Tower,Ueno Zoo,Asakusa Temple
