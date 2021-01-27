defmodule SimpleFactorial do
  def fact (n) do
    cond do
      n > 1 -> n*fact(n-1)
      n >=0 -> 1
      true  -> -1
    end
  end

  def factCase (n) do
    case n do
      n when n > 1 -> n*fact(n-1)
      n when n >=0 -> 1
      _ -> -1
    end
  end

end
valor = 5
IO.puts("Factorial de #{valor} == #{SimpleFactorial.factCase(valor)}")


defmodule SimpleFibonacci do
  def fibonacci (n) do
    cond do
      n == 0 -> 0
      n == 1 -> 1
      n > 1 -> fibonacci(n-1)+fibonacci(n-2)
      #true  -> 1
    end
  end
end

valor = 5
IO.puts("Fibonacci de #{valor} == #{SimpleFibonacci.fibonacci(valor)}")



#fibonacci = fn n ->
#  if n == 0 or n == 1 do
#
#  else
#
#  end
#
#end
