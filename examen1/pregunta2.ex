defmodule PuntoDos do
  def puntodos(list \\ []) when is_list(list), do: reduce(list, [], 0, &(&1 + &2))
  ##################################
  def reduce(list, newList, acc, sum) when is_function(sum,2), do:  reducep(list, newList, acc, sum)
  def reducep([], newList, _, _), do: newList
  def reducep([h | t],  newList, acc, sum),  do: reducep(t, newList ++ [sum.(acc, h)],sum.(acc, h), sum)

end

list = [1, 3, 4, -1]
IO.inspect (PuntoDos.puntodos(list))
