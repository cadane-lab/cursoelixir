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
  #defp for_loopP2(i, n, value, [h | t], newList) when i<=n, do: for_loopP2(i+1, n, value + h, t, newList ++ [value])
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


###############################################################
defmodule PuntoTres do
  def principal?(list) when is_list(list) do
    principalp?(1, length(list), list)
  end

  defp principalp?(_, _, list) when list == [], do: :true

  defp principalp?(i, n, list) do
    v1 = Enum.at(list, i-1)
    v2 = Enum.at(list, i)
    #IO.puts("Compara #{v1} #{v2}")

    cond do
      i == n -> :true
      v1 > v2 ->
        principalp?(i+1, n, list)
      v1 <= v2 ->
         :false
      end
  end

end
list = [1, 2, 3]
IO.puts("Punto tres: ")
IO.inspect(list)
IO.puts(PuntoTres.principal?(list))

######################################################
defmodule PuntoCuatro do
  def principal?(list) when is_list(list), do: principalp?(1, length(list), list, Enum.at(list, 0), Enum.at(list, 1))
  defp principalp?(_, _, list, _, _) when list == [], do: :true #Cuando la lista esta vacia
  defp principalp?(i, n, _, v1, v2) when i == n and v1 > v2, do: true #Cuando se completa el ciclo
  defp principalp?(i, n, list, v1, v2) when v1 > v2, do: principalp?(i+1, n, list, Enum.at(list, i-1), Enum.at(list, i)) #Vuelve y se llama
  defp principalp?(_, _, _, v1, v2) when v1 <= v2, do: :false

end

IO.puts("Punto cuatro: ")
IO.inspect(list)
IO.puts(PuntoCuatro.principal?(list))
