defmodule Raisesup do
  @moduledoc """
  Documentation for `Raisesup`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Raisesup.hello()
      :world

  """
  def hello do
    :world
  end

  def inicio() do
    {:ok, observer} = GsObserver.create(0)
    GsObserver.read(observer) |> IO.inspect()
    GsObserver.attach(observer) |> IO.inspect()
    GsObserver.increment(observer, 100) #|> IO.inspect()
    GsObserver.decrement(observer, 10) #|> IO.inspect()
    GsObserver.read(observer) |> IO.inspect()
  end
end
#{:ok, sup} = Raisesup.Supervisor.start_link([])
#[{_, observer, _, _}] = Supervisor.which_children(sup)
#observer
#GsObserver.read(GsObserver)
#
#GsObserver.increment(GsObserver, 100)
#GsObserver.decrement(GsObserver, 10)
#
#GsObserver.read(GsObserver)
