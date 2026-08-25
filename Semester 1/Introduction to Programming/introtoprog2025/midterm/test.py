sum = 0
while True:
    n = input()
    if n == "0":
        break
    list = n.split(' ')#put inside while loop to count other lines( if put outside will only count from first n(input)
    for numbers in list:
        if int(numbers) % 7 == 0:
            sum += int(numbers)

print(sum)

