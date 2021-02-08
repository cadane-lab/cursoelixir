defmodule Observable do
  @spec create(interger()) :: pid()
  def create(initialState \\ 0) do
    spawn(__MODULE__, :listen, [[], initialState])
  end

  defp listen(observers, state) do
    receive do
      {:attach, observer_pid} ->
        #new_observers = add_observer(observers, observer_pid)
        # listen
        observers |> add_observer(observer_pid) |> listen(state)

      {:detach, observer_pid} ->
        # new_observer = remove_observer(observer, observer_pid)
        # listen(new_observer, state)
        observers |> remove_observer(observer_pid) |> listen(state)

      {:increment} ->
        state = state + 1
        notify(observers, state)
        listen(observers, state)

      {:decrement} ->
        state = state - 1
        notify(observers, state)
        listen(observers, state)

      {:read, reader_pid} ->
        send(reader_pid, state)
        listen(observers, state)
    end
  end

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observer, observer_pid), do: observers -- [observer_pid]

  defp notify(observer, state) do
    #
    #
    observer |> Enum.each(&send(&1, state))
  end

  def attach(subject), do: send(subject, [:attach, self()])
  def detach(subject), do: send(subject, [:detach, self()])
  def increment(subject), do: send(subject, {:increment})
  def decrement(subject), do: send(subject, {:decrement})

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await(millis \\ 1000) do
    receive do
      count -> count
    after
      millis -> :timeout
    end

  end
end
