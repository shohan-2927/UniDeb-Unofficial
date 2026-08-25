s = input('input: ')
list = []
while s != 'END':
    r = ''
    for c in s:
        if c.isupper():
            r += c
    list.append(r)
    s = input('input: ')


for output in list:
    print(output)