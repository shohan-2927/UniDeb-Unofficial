import sys
for line in sys.stdin:
    output = ''
    for letters in line.strip():
        if letters.lower() in "aeiou":
            output= output + letters
    print(output)