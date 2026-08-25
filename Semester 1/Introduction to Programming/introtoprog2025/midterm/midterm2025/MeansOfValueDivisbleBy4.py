#Write a program that randomly generates n numbers between 50 to 100 and count the mean of values
# divisible by 4, display with 2 decimals and if there are no numbers return 0
import random

n = int(input("range of numbers"))
count = 0
sum = 0
for i in range(0,n):
    number = random.randint(50,100)
    print(number,end = ' ')
    if number % 4 == 0:
        count += 1
        sum += number
mean = sum /count
print("\n{0:.2f}".format(mean))