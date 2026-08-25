import sys


def rec_sum(x: int):
    if x == 2:
        return (1/2) * (x**3 - 5*x)
    return (1/2)*(x**3 - 5*x) + rec_sum(x-1)


output = []
for line in sys.stdin:
    if int(line) == 0:
        break
    number = rec_sum(int(line))
    output.append(number)


for number in output:
    print(number, end= " ")