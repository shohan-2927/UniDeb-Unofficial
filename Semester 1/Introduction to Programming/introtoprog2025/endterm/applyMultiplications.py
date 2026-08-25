import sys

numbers = []
argc = len(sys.argv)
multiplier = float(sys.argv[1])


def apply_multiplications(numbers: list, multiplier: float) -> list:
    new = []

    for i in range(len(numbers)):
        v = numbers[i] * multiplier
        new.append(v)
    return new




for i in range(2, argc):
    numbers.append(int(sys.argv[i]))

new = apply_multiplications(numbers, multiplier)


for i in range(len(new) - 1):
    print('{0:.3f}'.format(new[i]), end=" ")

print('{0:.3f}'.format(new[len(new)-1]))




# import sys
#
# def apply_multiplications(numbers: list, multiplier: float) -> list:
#     new = [x * multiplier for x in numbers]
#     return new
#
# if len(sys.argv) < 3:
#     print("Usage: python script.py <multiplier> <num1> <num2> ...")
#     sys.exit(1)
#
# multiplier = float(sys.argv[1])
# numbers = [int(x) for x in sys.argv[2:]]
# new = apply_multiplications(numbers, multiplier)
#
# for i, val in enumerate(new):
#     end_char = " " if i < len(new) - 1 else "\n"`
#     print(f"{val:.3f}", end=end_char)
