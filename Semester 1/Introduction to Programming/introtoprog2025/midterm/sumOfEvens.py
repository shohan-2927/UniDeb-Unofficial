sums = 0
numbers = input()
try:
    while True:
        for number in numbers:
            data = numbers.strip('\n')
            if int(data) % 2 == 0:
                sums += int(data)
        numbers = input()
except EOFError:
    print(sums)



