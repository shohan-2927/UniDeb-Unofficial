import sys

def count_local_max(l: list) -> int:
    count = 0
    for i in range(0,len(l)-1):
        num = l[i]
        if num >= l[i-1] and num >= l[i+1]:
            count += 1
    return count

def main():
    with open(sys.argv[1]) as file:
        for line in file:
            data = line.strip('\n').split()
            print(count_local_max(data))


# no need to make a file since ita commandline arg
if __name__ == "__main__":
    main()
