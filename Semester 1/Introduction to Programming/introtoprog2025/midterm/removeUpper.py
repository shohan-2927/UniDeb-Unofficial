s = input('input: ')

list = []
while s != 'END':
    r = ''
    for c in s:
        if c.islower():
            r += c
    list.append(r)
    s = input('input: ')
for output in list:
    print(output)