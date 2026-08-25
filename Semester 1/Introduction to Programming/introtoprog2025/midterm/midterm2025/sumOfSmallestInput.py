# Write a program that reads multidigit numbers until 0 and return the sum of the smallest input number
smallest = 999999999999  # you can use float('inf') / int('inf) here too if u wish
sum = 0
while True:
        number = input("type a number: ")
        if(number == "0"):
            break

        if int(number) < smallest:
            smallest = int(number)



for character in str(smallest):
    sum += int(character)

print(sum)




