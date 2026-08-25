import sys

list_of_numbers = []
argc = len(sys.argv)
pow = float(sys.argv[1])
def apply_exponent(numbers: list, pow: float) -> list:
    output = []
    for number in numbers:
        number = abs(number) ** pow
        output.append(number)

    return output


for i in range(2, argc):
    list_of_numbers.append(int(sys.argv[i]))


output = apply_exponent(list_of_numbers, pow)

for i in range(len(output) - 1):
    print('{0:.3f}'.format(output[i]), end=" ")

print('{0:.3f}'.format(output[len(output)-1]))

# to run, go to "Run with parameters" and add
# 4.21 -72 90 -40 22 -49

# CAUTION, THIS EXERCISE  EXPECTED OUTPUT IS  WRONG, as the given exponent is far too large
# the first argument should be 2.21 instead of 4.21 for most of the outut to match,