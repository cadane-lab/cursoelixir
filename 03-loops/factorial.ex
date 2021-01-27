defmodule Factorial do
  def classic (n) when is_integer(n) and n >= 0 do
    cond do
      n < 2 -> 1
      true -> facp1(n, 0, 1)
    end
  end

  def fac1(n) when is_integer(n) and n >= 0 do
    facp1(n, 0, 1)
  end

  defp facp1 (n, i, acc) when is_integer(n) do
    cond do
      i == n -> acc
      true -> facp1(n, i+1, acc * (i+1))

    end
  end
end

Factorial.classic(5)
