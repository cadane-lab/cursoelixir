defmodule ListOperation do

  def sum(list) when is_list(list) do
    vLength = length(list)
    for_loopSum(0, vLength, list, 0)
  end

  def for_loopSum(i, n, list, value)do
    cond do
      i < n ->
        #IO.puts("#{value} #{i}")
        value = value + getValue(list, i)
        for_loopSum(i+1, n, list, value)
        true ->
          value
    end
  end

  defp getValue(lista, pos), do: Enum.at(lista, pos)

  #################################222222222
  def reverse(list) when is_list(list) do
    vLength = length(list)
    for_loopReverse(0, vLength, list, [], (vLength-1))
  end

  defp for_loopReverse(i, n, lista, resulLista, v)do
    cond do
      i < n ->
        #IO.puts("valor #{Enum.at(lista, n)} - #{i}")
        resulLista = resulLista ++ [Enum.at(lista, v)] #["Cherry"]
        for_loopReverse(i+1, n, lista, resulLista, v-1)

        true ->
          resulLista
    end
  end

  ############33333333333

  def is_accendent?(list) when is_list(list) do
    vLength = length(list)
    for_loopAccen(1, vLength-1, list)
    #IO.inspect(list)
  end

  def for_loopAccen(i, n, list)do
    v1 = Enum.at(list, i-1)
    v2 = Enum.at(list, i)
    #IO.puts("Compara #{v1} #{v2}")

    cond do
      i == n -> :true
      v1 <= v2 ->
        #IO.puts("Compara #{v1} #{v2} -True")
        for_loopAccen(i+1, n, list)
      v1 > v2 ->
         # IO.puts("Compara #{v1} #{v2} -Falso")
          :false
    end
  end

end

#list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#list = [2, 1, 3, 4, 5, 6, 7, 8, 9, 10]
list = [1, -2, 3, 4, 5, 6, 7, 8, 9, 10]
#list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

list2 = []
IO.inspect(list)
IO.puts("_________________________")
IO.puts("Suma total: #{ListOperation.sum(list)}")

IO.puts("_________________________")
IO.puts("En reversa: ")
IO.inspect(ListOperation.reverse(list))

IO.puts("_________________________")
IO.puts("Es acendente: #{ListOperation.is_accendent?(list)}")
