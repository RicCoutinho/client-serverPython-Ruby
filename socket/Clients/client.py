import socket

while True:
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print ('BEM-VINDO À ACADEMIA')
    print ('Insira sua matrícula')
    matricula = input().encode('utf-8')

    client.connect(('0.0.0.0', 4000))
    client.send(matricula)

    from_financial_server = client.recv(10000).decode('utf-8')
    print (from_financial_server)

    from_financial_server = client.recv(10000).decode('utf-8')
    print (from_financial_server)
    client.close()