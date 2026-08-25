n = input()
count = 0
while n != '0':
    list = n.split(' ')#put inside while loop to count other lines( if put outside will only count from first n(input)
    for numbers in list:
        if int(numbers) % 5 == 0:
            count += 1
    n = input()
print(count)


# for loops, only operate inside the loop, will not calculate for variables outside the loop(IMPORTANT)
