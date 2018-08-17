# start the netcat (nc) tool at the prompt to make a connection with the Julia server on port 8080: 
# nc localhost 8080
using Sockets
server = Sockets.listen(8080)
while true
  conn = accept(server)
  @async begin
    try
      while true
        line = readline(conn)
        println(line)
        write(conn,line)
      end
    catch ex
      print("connection ended with error $ex")
    end
  end # end coroutine block
end