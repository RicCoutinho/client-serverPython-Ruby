import socket
serv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serv.bind(('0.0.0.0', 4000))
serv.listen(5)
while True:
    conn, addr = serv.accept()
    from_client = ''
    while True:
        data = conn.recv(10000)
        if not data: break
        from_client += data
        print (from_client)
        conn.send("I am SERVER<br>")
    conn.close()
    print ('client disconnected')