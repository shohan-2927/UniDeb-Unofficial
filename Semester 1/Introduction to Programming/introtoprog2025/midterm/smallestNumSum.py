# Write a program that reads multidigit numbers until 0 and return the sum of the smallest input number

smallest = int('inf')

while True:
    n = int(input())
    if n == 0:
        break

    if n  < smallest:
        smallest = n


smallestSum = 0
for digit in str(smallest):
    smallestSum += int(digit)
print(smallestSum)