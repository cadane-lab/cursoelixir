IO.puts("1____________________Sumatoria________________")
defmodule Sumatoria do

  def principal(n) when is_integer(n) and n >= 1 do
    for_loopSuma(1, n, 1)
  end

  def for_loopSuma(i, n, value)do
    if i < n do
      v = i+1
      IO.puts("Suma: #{value} + #{v} = #{value + v}")
      for_loopSuma(v, n, value + v)
    else
      :ok
    end
  end

end
IO.puts(Sumatoria.principal(5))

IO.puts("2____________________Fibonacci________________")
defmodule SerieFibonacci do
  def principal(n) when is_integer(n) and n > 0 do
    fibop(n, 0, 1)
  end

  defp fibop(1, a, b), do: b
  defp fibop(n, a, b), do: fibop(n-1, b, a+b)
  #def principal(n) when is_integer(n) and n > 0 do
  #  result = cond do
  #    n > 2 -> principal(n-1) + principal(n-2)
  #    n == 1 or n == 2 -> 1
  #  end
  #  IO.puts("valor: #{result}")
  #  result
  #end
#
  #def do_while(i, n, value) do
  #  if i < n do
  #    IO.puts("#{value} #{i}")
  #    do_while(i+1, n, value)
  #  else
  #    :ok
  #  end
  #end


end
vF = 10
IO.puts("Fibonacci(#{vF}) #{SerieFibonacci.principal(vF)}")

IO.puts("3____________________Some function________________")
defmodule SomeFunction do
  def principal(a, b) when is_integer(a) and is_integer(b) do
    result = cond do
      a == 0 and b == 0 -> 0
      a == b -> principal(a-1, b-1) + 2 * (a-1)
      a > b  -> principal((a-b), b) + principal(b, b)
      a < b  -> principal(a, a) + principal((b-a), a)
    end
    #IO.puts(result)
    result
  end
end
v1 = 1
v2 = 5
IO.puts("SomeFuncion to #{v1} and #{v2} = #{SomeFunction.principal(v1,v2)}")
#SomeFunction.principal(v1,v2)
#IO.puts("SomeFuncion for #{v1} and #{v2}")

IO.puts("4____________________Mcd or Gcd________________")
defmodule McdOrGcd do

  def principal(a, b) when is_integer(a) and is_integer(b) do
    result = cond do
      b == 0 -> a
      b > a  -> principal(b, a)
      true -> principal((a-b), b)
    end
    #IO.puts(result)
    result
  end
end
v1MCD = 180
v2MCD = 48
IO.puts("Mcd Or GCD to #{v1MCD} and #{v2MCD} = #{McdOrGcd.principal(v1MCD,v2MCD)}")


IO.puts("5_____________________0101_____________________")
defmodule Intercalados do

  def principal(n) when is_integer(n) and n>1 do
    for_loopAdd(1, n, 1, "1")
  end

  defp for_loopAdd(i, n, value, concatenado)do
    IO.puts(concatenado)
    if i < n do
      result = cond do
        value == 1 -> concatenado = "#{0}#{concatenado}"
                      for_loopAdd(1, n-1, 0, concatenado)
        value == 0 -> concatenado = "#{1}#{concatenado}"
                      for_loopAdd(1, n-1, 1, concatenado)
      end
      result
    else
      :ok
    end
  end

end
Intercalados.principal(6)
