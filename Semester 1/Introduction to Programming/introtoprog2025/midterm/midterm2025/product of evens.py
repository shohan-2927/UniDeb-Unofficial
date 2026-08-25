product = 0

while True:
    n = int(input())

    if n == 0:
        break


    for character in str(n):
        if int(character) % 2 == 0:
            product += int(character)


print(product)