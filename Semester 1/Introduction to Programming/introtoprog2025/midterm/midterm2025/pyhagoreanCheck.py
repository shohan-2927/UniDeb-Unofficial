list = []
while True:
    try:
        line = input()
        numbers = line.split()

        a = int(numbers[0])
        b = int(numbers[1])
        c = int(numbers[2])

        if a**2 + b**2 == c**2 or a**2 + c**2 == b**2 or a**2 + c**2 ==b**2 or c**2 + b**2 == a**2:
            list.append("YES")
        else:
            list.append("NO")
    except EOFError:
        break


for output in list:
    print(output)
