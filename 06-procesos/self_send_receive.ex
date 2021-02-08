await1 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  end
end

await2 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
    _ ->{:error, "there was't a match"}
  end
end

await3 = fn millis ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  after
    millis -> "Termineron los #{millis} milisegundos"
  end
end

test = fn await ->
  send self(), {:hello, "World"}
  IO.puts(await.())

  send self(), {:bye, "World"}
  IO.puts(await.())

  send self(), {:hi, "?"}
  IO.inspect(await.())
end

#test.(await1)

test.(await2)
test.(fn -> await3.(1000) end)

spawn fn -> send self(), {:hello, "World"} end
IO.puts(await3.(1000))

IO.puts("________________")
self_pid = self()
pid = spawn fn ->
  spid = self()
  send self_pid, {:pid, spid}
end

second_pid = await3.(1000)
IO.puts(pid === second_pid)
