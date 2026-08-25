import random
n = int(input('give a range'))
sum = 0
count = 0
for i in range(n):
    number = random.randint(25,85)
    print(number,end = ' ')
    if number % 2 != 0:
        sum += number
        count += 1


print("\n{0:.3f}".format(sum/count))
