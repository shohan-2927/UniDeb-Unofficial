#Write a program that reads words up to the ”END”
#string, and doubles/duplicates the uppercase letters.


while True:
    s = input()
    if s == "END":
        break
    r = ''
    for c in s:
        if c.isupper():
            r += c*2
        else:
            r += c
    print(r)


