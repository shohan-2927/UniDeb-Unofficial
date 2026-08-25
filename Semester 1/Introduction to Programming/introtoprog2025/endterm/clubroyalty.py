import sys
club_teams = {}
n = int(input('The average club range'))
for line in sys.stdin:
    data = line.split(':')
    teams = data[1].strip().split(',') # stripping needed for intact strings
    for i in range(len(teams)):
        if teams[i] in club_teams:
            club_teams[teams[i]] += 1
        else:
            club_teams[teams[i]] = 1
for (key,values) in sorted(club_teams.items(), key = lambda x:(-x[1],x[0])):
    if values > n:
        print(key,values)
    else:
        break