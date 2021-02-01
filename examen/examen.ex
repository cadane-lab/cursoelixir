defmodule Examen do
  def p1principal(list) when is_list(list) do
    vLength = length(list)
    #IO.puts(list[h])
    indice = Enum.at(list, 0)

    for_loopP1(0, vLength, 0, list, [])

  end

  defp for_loopP1(_, _, _, [], newList), do: newList

  defp for_loopP1(i, n, value, [h | t], newList) do
      cond do
      i <= n ->
        #IO.puts("v: #{value} + #{h}")
        value = value + h
        list = t
        newList = newList ++ [value]
        ##IO.puts("#{value} -#{i}")
        for_loopP1(i+1, n, value, list, newList)
        true ->
          newList
    end
  end
end

list = [1, 3, 4, -1]
#IO.puts(hd(list))
#IO.inspect(tl(list))
IO.puts("Lista:")
IO.inspect(list)
IO.puts("Punto uno: ")
IO.inspect(Examen.p1principal([])) # [1, 4, 8, 7]
#IO.inspect(Examen.p1principal([])) # [1, 4, 8, 7]
IO.inspect(Examen.p1principal(list)) # [1, 4, 8, 7]
#IO.inspect(Examen.p1principal(list)) # [1, 4, 8, 7]

defmodule PuntoDos do
  def punto_dos(list) when is_list(list), do: for_loopP2(0, length(list), 0, list, [])
  defp for_loopP2(_, _, _, [], newList), do: newList
  defp for_loopP2(i, n, value, [h | t], newList) when i<=n do
      value = value + h
      list = t
      newList = newList ++ [value]
      for_loopP2(i+1, n, value, list, newList)
  end
  defp for_loopP2(i, n, _, [_ | _], newList) when i > n, do: newList
end
IO.puts("Punto dos: ")
IO.inspect(PuntoDos.punto_dos(list))
