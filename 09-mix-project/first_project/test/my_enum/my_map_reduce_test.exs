defmodule MyMapReduceTest do
  use ExUnit.Case
  doctest MyMapReduce

  test "doubles aech element in a list" do
    import MyMapReduce, only: [double: 1]
    assert_raise FunctionClauseError, fn ->
      double(2)
    end
    assert double([]) == []
    assert double([1]) == [2]
    assert double([1, 3, 5, 6]) == [2, 6, 10, 12]
  end

  ###Prueba de suma
  test "Test for sum" do
    import MyMapReduce, only: [sum: 1]
    assert_raise FunctionClauseError, fn ->
      sum(2)
    end
    assert sum([]) == 0
    assert sum([1]) == 1
    assert sum([1, 2, 3, 4]) == 10
  end

  ###Prueba de filter
  test "Test for filter" do
    import MyMapReduce, only: [filter: 2]
    filtro = fn n -> rem(n, 4) == 0 end

    assert_raise FunctionClauseError, fn ->
      filter(2, filtro)
    end

    assert_raise FunctionClauseError, fn ->
      filter([], 2)
    end

    assert filter([], filtro) == []
    assert filter([1], filtro) == []
    assert filter([1, 2, 3, 4], filtro) == [4]
    assert filter([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], filtro) == [4, 8]
  end


  ###Prueba de reduce
  test "Test for reduce" do
    import MyMapReduce, only: [reduce: 3]
    accion = &(&1 + &2)

    assert_raise FunctionClauseError, fn ->
      reduce(2, 0, accion)
    end
    assert_raise FunctionClauseError, fn ->
      reduce([], 0, 2)
    end

    assert reduce([], 0, accion) == 0
    assert reduce([1], 0, accion) == 1
    assert reduce([1, 2, 3, 4], 0, accion) == 10
  end

end
