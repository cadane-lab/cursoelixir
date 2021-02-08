defmodule Obs do
  @spec create(interger()) :: pid()
  def create(initialState \\ 0) do
    spawn(__MODULE__, :listen, [[], initialState])
  end

  defp listen(observers, state) do
    receive do
      event ->
        {observers, state} = on_event(event, observers, state)
        listen(observers, state)
      end
  end

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observer, observer_pid), do: observers -- [observer_pid]

  defp notify(observer, state) do
    #
    #
    observer |> Enum.each(&send(&1, state))
    {observer, state}
  end

  def attach(subject), do: send(subject, [:attach, self()])
  def detach(subject), do: send(subject, [:detach, self()])
  #def increment(subject), do: send(subject, {:increment})
  #def decrement(subject), do: send(subject, {:decrement})

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

def on_event({:attach, observer_pid}, observer, state) do
  {observer |> add_observer(observer_pid), state}
end

def on_event({:detach, observer_pid}, observers, state) do
  {observers |> remove_observer(observer_pid), state}
end

def on_event({:read, reader_pid}, observers, state) do
  send(reader_pid, state)
  {observers, state}
end

## Extending
def on_event({:increment}, observers, state), do: notify(observers, state + 1)
def on_event({:decrement}, observers, state), do: notify(observers, state - 1)

def increment(subject), do: send(subject, {:increment})
def decrement(subject), do: send(subject, {:decrement})
