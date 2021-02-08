double = fn x -> 2 * x end
triple = fn x -> 3 * x end
filter = fn n -> rem(n, 4) == 0 end
is_mod3_plus_1 = fn n -> rem(n, 3) == 1 end
is_mod3_plus_2 = fn n -> rem(n, 3) == 2 end

list = 0..7

#a |> proc(fun)
# proc(a, fun)
result_enum = Enum.filter(Enum.map(list, double), filter)

#resul_enum1 = Enum.map(list, double) |> Enum.filter(filter)
#resul_enum1 = (list |> Enum.map(double) |> Enum.filter(filter))
result_enum1 = list |> Enum.map(double) |> Enum.filter(filter)

IO.puts("#{inspect(result_enum)}")
IO.puts("#{inspect(result_enum1)}")
IO.puts("---------------------------")

#int[] list = {0, 1, ..., 7}
#int [] doubles = {}
#int [] result
#













result = list |> Enum.map(double) |> Enum.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(result)}")
IO.puts("-------------------------")

#int [] list = {}
#int [] sextuplex =

result = list |> Stream.map(double) |> String.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(result)}")
IO.puts("------------------------")



















result =
  list
  |> Stream.map(double)
  |> Stream.map(triple)
  |> Stream.filter(filter)
  |> Enum.map(fn x -> x end)

  IO.puts("#{inspect(result)}")
  IO.puts("-----------------------")

 ############################################
 #Enum is eager
 #Stream is lazy
 #list |> stream1 |> stream2 |> enum1 |> stream3 |> enum2 |> stream4 |> stream5 |> enum3

  #filter5 = fn(x)->
  #  if (!my_cond && x) do
  #   some code(return boool)
#   else
#   false
# end
# end
#
# temporal = list |> stream1 |> stream2 |> enum1 |> stream3 |> enum2 |> stream4
# result = if my_cond do
# temporal |> enum3
#else
# temporal |> stream5 |> enum4
#end

#########################################
result = 0..7 |> Stream.drop(2) |> Enum.take(3)
IO.puts("#{inspect(result)}")

result = 0..3 |> Stream.drop(2) |> Enum.take(3)
IO.puts("#{inspect(result)}")
IO.puts("__________________________________")

#
#
#
#
#
#
#
#
#
result = 0..7 |> Stream.map(double) |> Stream.filter(is_mod3_plus_2) |> Enum.map(fn x -> x end)
IO.puts("#{inspect(result)}")


result = 0..7 |> Stream.filter(is_mod3_plus_1) |> Stream.map(double) |> Enum.map(fn x -> x end)
IO.puts("#{inspect(result)}")
IO.puts("__________________")
