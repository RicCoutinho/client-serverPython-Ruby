import socket

while True:
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print ('BEM-VINDO À ACADEMIA')
    print ('Insira sua matrícula')
    matricula = input().encode('utf-8')

    print ('SELECIONE O TIPO, MÉDICO OU FINANCEIRO')
    print ('(1) MÉDICO')
    print('(2) FINANCEIRO')
    tipo = input()

    if tipo == '1':
        client.connect(('0.0.0.0', 5000))
        client.send(matricula)
    elif tipo == '2':
        client.connect(('0.0.0.0', 4000))
        client.send(matricula)
    else: 
        print('OPÇÃO INCORRETA')

    from_server = client.recv(10000).decode('utf-8')
    print (from_server)
    client.close()