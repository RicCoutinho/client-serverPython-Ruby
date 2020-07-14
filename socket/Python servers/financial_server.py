import socket

HOST = "0.0.0.0"
PORT = 4000

s = socket.socket()

s.bind((HOST, PORT))
s.listen()

matriculas = { '0': False, '1': False, '2': True }

while True:
    client, addr = s.accept()

    receiver = client.recv(1024).decode('utf-8').rstrip()
    print("Matricula: %s recebida com sucesso." % receiver)

    if receiver in matriculas:
        if matriculas[receiver]:
            client.send('Passar no Setor Financeiro'.encode('utf-8'))
        else:
            client.send('Financeiro OK'.encode('utf-8'))
    else:
        client.send('Matricula Não Existe'.encode('utf-8'))    

    client.close()