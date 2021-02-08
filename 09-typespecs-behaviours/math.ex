defmodule Math do
  @typedoc """
  A division result can be a
  {:ok, result} where result is a number
  atom        :infinity, :nan
  {:error, msg} where msg es a string
  """
  @type division_result :: {atom(), number()} | atom() | {:error, String.t()}
  @spec div(number(), number()) :: division_result()

  def div(a, b) when is_number(a) and is_number(b) do
    try do
      a / b
    rescue
      ArithmeticError ->
        cond do
          b != 0 ->{:error, :i_dont_know}
          a == 0 ->{:error, :nan}
          true -> {:error, :infinity}
        end
    else
      result -> {:ok, result}
    end
  end
end

IO.inspect(div(5,5))
