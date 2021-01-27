defmodule SecuneciaCollatz do
  def secuencia(n) when is_integer(n) and n == 1 do
    "1 - Fin"
  end

  def secuencia(n) when is_integer(n) and n >= 0 do
    IO.puts(n)
    r = (rem(n,2))
    if r == 0 do
      #Es par - se divide por dos
      divide(n)
    else
      #Es impar- x3 + 1
      multiplica(n)
    end

  end

  defp divide(n) do
    valor = trunc(n/2)
    secuencia(valor)
  end

  defp multiplica(n) do
    valor = trunc((n * 3 ) + 1)
    secuencia(valor)
  end

end

IO.puts(SecuneciaCollatz.secuencia(18))
