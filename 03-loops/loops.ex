defmodule Loop do
  def for_loop(i, n, value)do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i+1, n, value)

        true ->
          :ok
    end
  end

  def do_while(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    do_while(i+1, n, value)
  end

  def do_while(i, n, value) do
    :ok
  end
end

Loop.for_loop(0, 3, "Loop")
Loop.do_while(0, 3, "Do_while")
#__________________________________________________________________
defmodule Propios do

  def for_loop(i, n, value)do
    if i < n do
      IO.puts("#{value} #{i}")
      for_loop(i+1, n, value)
    else
      :ok
    end
  end

  def do_while(i, n, value) do
    if i < n do
      IO.puts("#{value} #{i}")
      do_while(i+1, n, value)
    else
      :ok
    end
  end

  #def for_loopCase (i, n, value) do
  #  case i do
  #    i when i < n ->
  #      IO.puts("#{value} #{i}")
  #      for_loop(i+1, n, value)
  #    _ -> :ok
  #  end
  #end

end

Propios.for_loop(0, 3, "Loop Propio")
Propios.do_while(0, 3, "While Propio")
#Propios.for_loopCase(0, 3, "Loop case")
