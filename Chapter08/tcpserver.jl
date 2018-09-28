using Sockets
server = Sockets.listen(8080)
# Sockets.TCPServer(Base.Libc.WindowsRawSocket(0x00000000000002e4) active)

conn = accept(server)
# on the client: $ nc localhost 8080 	
# TcpSocket(connected,0 bytes waiting)
line = readline(conn)
# hello Julia server!	
# "hello Julia server!\n"
write(conn, "Hello back from server to client, what can I do for you?")
56
close(conn)