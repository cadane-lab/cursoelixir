defmodule Zero do
  #def is_zero(n) when is_integer(n) do
  #  n == 0
  #end

  def is_zero(n) do
    true
  end

  def is_zero(n) when is_integer(n) do
    :ok
  end

end

IO.puts(Zero.is_zero(1))
