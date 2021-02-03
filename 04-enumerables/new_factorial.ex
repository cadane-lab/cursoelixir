IO.puts("1____________________Facotial________________")
defmodule NewFactorial do
  def fac1(n) when is_integer(n) and n >= 0, do: facp1(n, 0, 1)
  defp facp1(n, i, acc) when is_integer(n) and i == n, do: acc
  defp facp1(n, i, acc) when is_integer(n) and i != n, do: facp1(n, i+1, acc * (i+1))
end
IO.puts("Facotial de 5: #{NewFactorial.fac1(5)}")


IO.puts("2.____________________Fibonacci________________")
defmodule SerieFibonacci do
  def principal(n) when is_integer(n) and n > 0, do: fibop(n, 0, 1)
  defp fibop(1, _, b), do: b
  defp fibop(n, a, b), do: fibop(n-1, b, a+b)
end
vF = 10
IO.puts("Fibonacci(#{vF}) #{SerieFibonacci.principal(vF)}")
