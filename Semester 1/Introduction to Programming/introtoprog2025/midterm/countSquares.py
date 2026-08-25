import math

# counts squares
n = input()
while True:
    count = 0
    try:
        numbers = n.split()
        for num in numbers:
            if int(math.sqrt(int(num)))**2 == int(num):
                count += 1
        print(count)
        n = input()
    except EOFError:
        break