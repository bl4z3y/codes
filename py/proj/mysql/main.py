import mysql.connector as mysqlc
from prettytable import PrettyTable as pt

# Configuração da conexão
config = {
    'user': 'positivo',
    'password': '76190403',
    'host': 'localhost',
    'database': 'teste',
    'raise_on_warnings': True,
}

# Conectando ao MySQL
try:
    connection = mysqlc.connect(**config)

    if connection.is_connected():
        print("Conectado ao MySQL")

        # Executando uma consulta
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM tabela")

        # Obtendo resultados
        results = cursor.fetchall()

        # Criando uma PrettyTable
        table = pt()
        table.field_names = [i[0] for i in cursor.description]

        for row in results:
            table.add_row(row)

        print(table)

except mysqlc.Error as err:
    print(f"Erro: {err}")

finally:
    # Fechando a conexão
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print("Conexão fechada")

