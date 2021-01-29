defmodule ListOperations do
  def suma(list) when is_list(list), do: sump(list, 0)
  defp sump([], acc), do: acc
  defp sump([h | t], acc), do: sump(t, acc + h)

  def reverse(list) when is_list(list), do: reversep(list, [])
  defp reversep([h | t], reversedList), do: reversep(t, [h] ++ reversedList)
  defp reversep([], reversedList), do: reversedList

  def reverse1(list) when is_list(list), do: reversep1(list, [], length(list))
  defp reversep1(list, reversedList, len) when len < 2, do: list ++ reversedList
  defp reversep1([h | t], reversedList, len), do: reversep1(t, [h] ++ reversedList, len - 1)

  def ascendant?(list \\ []) when is_list(list), do: ascendant_p?(nil, list)
  defp ascendant_p?(_, []), do: true
  defp ascendant_p?(nil, [b | tail]), do: ascendant_p?(b, tail)
  defp ascendant_p?(a, [b | tail]) when a <= b, do: ascendant_p?(b, tail)
  defp ascendant_p?(_, _), do: false
end

IO.puts("----Suma----")
IO.puts(ListOperations.suma([])) #0
IO.puts(ListOperations.suma([1, 2, 3])) #6
IO.puts(ListOperations.suma([5, 3, -1, 2])) #9

IO.puts("----Reverse----")
IO.inspect(ListOperations.reverse([])) #0
IO.inspect(ListOperations.reverse([1])) #6
IO.inspect(ListOperations.reverse([2, 3])) #9
IO.inspect(ListOperations.reverse([2, 5, 7]))
IO.inspect(ListOperations.reverse([9, 6, 4, 5]))

IO.puts("----Reverse1----")
IO.inspect(ListOperations.reverse1([])) #0
IO.inspect(ListOperations.reverse1([1])) #6
IO.inspect(ListOperations.reverse1([2, 3])) #9
IO.inspect(ListOperations.reverse1([2, 5, 7]))
IO.inspect(ListOperations.reverse1([9, 6, 4, 5]))
