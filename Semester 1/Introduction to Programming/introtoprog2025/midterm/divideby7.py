total_sum = 0
while True:
    num = list(map(int, input().split(" ")))
    if num == [0]:
        break
    for i in num:
        if i % 7 == 0:
            total_sum += i
print(total_sum)