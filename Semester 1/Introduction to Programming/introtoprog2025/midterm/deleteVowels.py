import sys
list = []
for s in sys.stdin:
    r = ''
    for c in s.strip():
        if c not in "aeiouAEIOU":
            r += c
    list.append(r)


for output in list:
    print(output)