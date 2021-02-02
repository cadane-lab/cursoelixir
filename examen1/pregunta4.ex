defmodule PuntoCuatro do
  def principal?(list \\ []) when is_list(list), do: reduce(list, nil, nil)
  def reduce(list, acc, action), do:  reducep(list, acc, action)
  def reducep([], _, _), do: true
  def reducep([head | tail ], acc, action) when acc >= head,  do: reducep(tail, head, action)
  def reducep(_, _, _), do: false
end

IO.puts (PuntoCuatro.principal?([12, 9, 7, 2, 1 ]))
IO.puts (PuntoCuatro.principal?([12, 9, 12, 1, 2 ]))
