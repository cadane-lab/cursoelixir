result = cond do
  2 + 3 == 4 -> "2 + 3 == 4"
  2 * 3 == 4 -> "2 * 3 == 4"
  1 + 1 == 2 -> "1 + 1 == 2"
end
IO.puts(result)

result = cond do
  2 + 3 == 4 -> "2 + 3 == 4"
  2 * 3 == 4 -> "2 * 3 == 4"
  1 + 2 == 2 -> "1 + 2 == 2"
  true -> nil #Rquiere para cuando ninguna se cumpla
end
IO.puts(result)

result = cond do
  hd([0, "hola", :ok]) -> "0 trabaja como true"
end
IO.puts(result)

result = cond do
  hd(["hola", 0, :ok]) -> "hola trabaja como true"
end
IO.puts(result) #Hola trabaja como true

result = cond do
  hd([:ok, "hola", 0]) -> "ok trabaja como true"
end
IO.puts(result) #Ok trabaja como true

result = cond do
  hd([:error, "hola", 0]) -> "error trabaja como true"
end
IO.puts(result) #error trabaja como true


result = cond do
  hd([true, "hola", 0]) -> "true trabaja como true"
end
IO.puts(result) #true trabaja como true

result = cond do
  hd([false, "hola", 0]) -> "false trabaja como true"
  true -> "False trabaja coo false"
end
IO.puts(result) #false trabaja como false

result = cond do
  hd([false, "hola", 0]) == false -> "false == false trabaja como true"
end
IO.puts(result) #true trabaja como true
