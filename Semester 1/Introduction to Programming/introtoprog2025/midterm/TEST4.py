numbers = [i for i in range(1,21)]
print(numbers)
res = [i+2 for i in numbers if i % 3 == 0]
print(res)