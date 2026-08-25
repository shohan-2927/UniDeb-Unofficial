n = int(input("Range of numbers:"))
count = 0
for i in range (n):
    number = int(input())
    if number % 2 == 0 and number > 0:
        count += 1


print(count)


