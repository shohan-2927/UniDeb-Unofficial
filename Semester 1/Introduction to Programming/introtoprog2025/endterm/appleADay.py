
# apple a day
import sys
fruits_child = {}
for data in sys.stdin:
    fruits = data.split(':')
    child = fruits[1].strip().split(',')
    for i in range(0,len(child)): # checking for all variables in the child list
        if child[i] in fruits_child: # checking for child value in dicts
            fruits_child[child[i]] += 1
        else:
            fruits_child[child[i]] = 1

for (key,value) in sorted(fruits_child.items()):
    print(key,fruits_child[key])
