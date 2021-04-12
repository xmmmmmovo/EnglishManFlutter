import csv
import pymysql


def main():
    cnt = 0
    db = pymysql.connect(
        host='',
        user='root',
        password='',
        port=,
        database='jpr',
        charset='utf8'
    )
    cur = db.cursor()
    w = []

    csvdata = csv.DictReader(open('./data/ECDICT/stardict.csv', encoding='utf8'))
    # print(''.join([f"row['{w}'], " for w in csvdata.fieldnames]))
    for row in csvdata:
        for (k, v) in row.items():
            if v == '':
                row[k] = None
        try:
            cur.execute(
                "INSERT INTO word(`word`, `phonetic`, `definition`, `translation`, `pos`, `collins`, `oxford`, `tag`, `bnc`, `frq`, `exchange`, `detail`, `audio`, `sw`) VALUES "
                "(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                (row['word'], row['phonetic'], row['definition'], row['translation'], row['pos'], row['collins'],
                 row['oxford'], row['tag'], row['bnc'], row['frq'], row['exchange'], row['detail'], row['audio'],
                 (''.join([n for n in row['word'] if n.isalnum()])).lower()))
            cnt += 1
        except:
            w.append(row)

        if cnt == 1000:
            cnt = 0
            print('commit it')
            db.commit()

    db.commit()
    print(w)


if __name__ == '__main__':
    main()
