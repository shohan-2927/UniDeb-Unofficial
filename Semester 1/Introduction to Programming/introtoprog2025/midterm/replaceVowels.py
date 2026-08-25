output = []
while True:
    string = input()
    if string == "STOP":
        break
    new_string = ''

    for character in string:
        if character in "aeiouAEIOU":
            new_string += "*"

        else:
            new_string += character

    output.append(new_string)



for words in output:
    print(words)