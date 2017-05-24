# python3 ftw

# bukalapak.csv - ourform.csv
# which trx id is in bukalapak, but not in our form yet?

import csv

bl = []
ours = []

with open('bl.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        bl.append(row[1])


with open('ours.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        if row[2]:
            ours.append('170' + row[2].rsplit('/', 1)[-1])


delta = set(bl) - set(ours)
print(delta)
