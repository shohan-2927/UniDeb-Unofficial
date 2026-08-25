s = input('input: ')
list = []
while s != 'END':
    r = ''
    for character in s:
        if character != " ":
            r += character
    list.append(r)
    s = input('input: ')

for output in list:
    print(output)