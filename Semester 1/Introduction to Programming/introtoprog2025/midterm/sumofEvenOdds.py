# adds up all the even and odd digits in a given number and calculate the difference
while(True):
    even = 0
    odd = 0

    n = input()
    if n == "0":
        break
    data = n.split()
    for number in data:
        for character in number:
            if int(character) % 2 == 0:
                even += int(character)
            else:
                odd += int(character)


    diff = even - odd
    print(diff)
