import math

# counts squares
list = []
while True:
    count = 0
    try:
        n = input()
        numbers = n.split()
        for num in numbers:
            if int(math.sqrt(int(num)))**2 == int(num):
                count += 1
        list.append(count)
    except EOFError:
        break

for output in list:
    print(output)
