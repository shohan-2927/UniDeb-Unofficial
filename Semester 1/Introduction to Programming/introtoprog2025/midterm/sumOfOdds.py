sums = 0
number = input()
try:
    while True:
        for numbers in number:
            data = numbers.strip('\n')
            if int(data) % 2 != 0:
                sums += int(data)
        number = input()
except EOFError:
    print(sums)
