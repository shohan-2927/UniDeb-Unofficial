import random
n = int(input('give a range'))
sum = 0
count = 0
for i in range(n):
    number = random.randint(15,65)
    print(number,end = ' ')
    if number % 2 == 0:
        sum += number
        count += 1

arith_mean = round(sum / count,2)
print("\n{0:.2f}".format(arith_mean))