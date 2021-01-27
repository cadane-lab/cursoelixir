#Variables simples
IO.puts("------Variables simples----------")
x = 5
y = case 10 do
  ^x -> "El valor concuerda con #{x}"
  _->"El valor no concuerda con #{x}"
end
IO.puts(y)

#Tuplas
IO.puts("------Tupla----------")
{:ok, result} = case {1, "hello", :ok} do
  {1, x, _} -> {:ok, x}
  _ -> {:error, "No concuerda"}
end
IO.puts(result)


IO.puts("------Probando------")
result = case {1, 2, 3} do
  {_, x, 3} when x > 0 -> "Concuerda"
  _ -> "No concuerda"
end
IO.puts(result)


##################
x = [1, 2, 3]

result = case 1 do
  x when x < 0-> "No concuerdan"
  x-> "Value #{x}"
end
IO.puts(result)

result = case -1 do
  x-> "Value #{x}"
  x when x < 0-> "No concuerdan"
end
IO.puts(result)

result = case 1 do
  a-> "Value #{a}"
  _-> "No concuerdan"
end
IO.puts(result)
