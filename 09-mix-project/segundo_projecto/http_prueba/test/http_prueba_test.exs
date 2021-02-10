defmodule HttpPruebaTest do
  use ExUnit.Case
  doctest HttpPrueba

  test "greets the world" do
    assert HttpPrueba.hello() == :world
  end
end
