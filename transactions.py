# python3 ftw

# bukalapak.csv - ourform.csv
# which trx id is in bukalapak, but not in our form yet?

import csv

bl = []
ours = []
bl_processed = 0
bl_unprocessed = 0
bl_returned = 0
bl_total = 0


with open('bl.csv', newline='') as csvfile:
    lines = csv.reader(csvfile)

    for i, row in enumerate(lines):
        if i:
            status = row[21]
            count = int(row[18])
            bl_total += count

            if row[21] == 'Dibayar':
                bl_unprocessed += count
            elif status == 'Dikembalikan':
                bl_returned += count
            else:
                bl.append(row[1])
                bl_processed += count



with open('ours.csv', newline='') as csvfile:
    lines = csv.reader(csvfile)

    for row in lines:
        if row[2]:
            ours.append('170' + row[2].rsplit('/')[-1])


delta = set(bl) - set(ours)
print("BL tickets processed: " + str(bl_processed))
print("BL tickets unprocessed: " + str(bl_unprocessed))
print("BL tickets returned: " + str(bl_returned))
print("BL tickets total: " + str(bl_total))
print("Transactions without form data: ")
for trx in delta:
    print(trx)
