defmodule SecuneciaCollatz do
  def secuencia(n) when n == 1 do
    "1 - Fin"
  end

  def secuencia(n) when is_integer(n) and n > 0 do
    IO.puts(n)
    if rem(n,2) == 0 do
      #Es par - se divide por dos
      #divide(n)
      valor = div(n, 2)
      secuencia(valor)
    else
      #Es impar- x3 + 1
      #multiplica(n)
      valor = n * 3  + 1
      secuencia(valor)
    end

  end

  #defp divide(n) do
  #  valor = trunc(n/2)
  #  secuencia(valor)
  #end
#
  #defp multiplica(n) do
  #  valor = trunc((n * 3 ) + 1)
  #  secuencia(valor)
  #end

end

IO.puts(SecuneciaCollatz.secuencia(578))
