import random
n = int(input("range of numbers"))
count = 0
product = 1
for i in range(0,n):
    number = random.randint(30,80)
    print(number,end = ' ')
    if number % 2 != 0:
        count += 1
        product *= number
geometric_mean = product ** 1/count
print("\n{0:.2f}".format(geometric_mean))