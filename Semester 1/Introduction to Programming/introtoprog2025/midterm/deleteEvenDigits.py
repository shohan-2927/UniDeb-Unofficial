import sys
def delete_even_digits(original: str) -> str:
    return "".join([c for c in original
        if c not in "02468"])

def main()-> None:
    for line in sys.stdin:
        print(delete_even_digits(line.strip()))


if __name__=='__main__':
    main()
