import connsql


def main():
    con, cursor = connsql.connect()
    cursor.execute("SELECT * FROM tabela")
    connsql.showTable(cursor)

    connsql.exec_show(cursor, "SELECT * FROM Gastos")

if __name__ == "__main__": main()


""" def showTable(cursor):
    results =  cursor.fetchall()

    table = pt()
    table.field_names = [[i[0] for i in cursor.description]]

    print(results)
    for row in results:
        table.add_row(row)

    print(table)
    return table

def exec_show(cursor, query: str):
    cursor.execute(query)
    results = cursor.fetchall()

    _ = pt()
    _.field_names = [[i[0] for i in cursor.description]]
    for row in results:
        _.add_row(row)
    print(_) """