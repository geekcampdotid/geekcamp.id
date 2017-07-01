# python3 ftw

# bukalapak.csv - ourform.csv
# which trx id is in bukalapak, but not in our form yet?

import csv

bl = []
ours = []
bl_total = 0

with open('bl.csv', newline='') as csvfile:
    lines = csv.reader(csvfile)

    for i, row in enumerate(lines):
        if i:
            bl.append(row[1])
            bl_total += int(row[18])


with open('ours.csv', newline='') as csvfile:
    lines = csv.reader(csvfile)

    for row in lines:
        if row[2]:
            ours.append('170' + row[2].rsplit('/')[-1])


delta = set(bl) - set(ours)
print("BL tickets count: " + str(bl_total))
print("Transactions without form data: ")
for trx in delta:
    print(trx)
