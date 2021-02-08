##Similar a soawn oerei enlazado
pid = spawn_link(fn -> 1 + 2 end)
IO.inspect(pid)
pid1 = spawn(fn -> raise "Opps! hubo un error" end)
#pid2 = spawn_link(fn -> raise "Opps! hubo un error" end)
IO.inspect(pid1)
#IO.inspect(pid2)
## Task
#Based on spawn
{:ok, pid} = Task.start(fn -> 1 + 2 end)
IO.inspect(pid)

#based on spawn_link
{:ok, pid} = Task.start_link(fn -> 1 + 2)
IO.inspect(pid)
