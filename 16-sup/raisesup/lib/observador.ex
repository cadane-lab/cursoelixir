defmodule GsObserver do
  use GenServer

  def start_link(opts), do: GenServer.start_link(__MODULE__, {[], 0}, opts)

  def init(value), do: {:ok, value}

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  def read(subject), do: GenServer.call(subject, :read)
  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  def detach(subject), do: GenServer.cast(subject, {:detach, self()})
  def increment(subject, amount), do: GenServer.cast(subject, {:increment, amount})
  def decrement(subject, amount), do: GenServer.cast(subject, {:decrement, amount})

  def handle_cast({:attach, observer_pid}, {observers, value}) do
    observers = observers |> add_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:detach, observer_pid}, {observers, value}) do
    observers = observers |> remove_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:increment, amount}, {observers, value}) do
    value = value + amount
    observers |> notify(value)
    {:noreply, {observers, value}}
  end

  def handle_cast({:decrement, amount}, {observers, value}) do
    value = value - amount
    observers |> notify(value)
    {:noreply, {observers, value}}
  end

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

  defp notify(observers, value) do
    observers |> Enum.each(&send(&1, value))
  end
end

#defmodule FObs do
#  use GenServer
#  #@spec create(integer()) :: pid()
#  def create(initialState \\ 0) do
#    spawn(__MODULE__, :listen, [{[], initialState}])
#  end
#
#  defp listen({observers, state}) do
#    receive do
#      event ->
#          #{observers, state} = on_event(event, observers, state)
#          #listen(observers, state)
#          handle_call(event, observers, state) |> listen()
#    end
#  end
#
#  def init(state), do: {:ok, state}
#
#  def add_observer(observers, observer_pid), do: [observer_pid | observers]
#  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]
#
#  defp notify(observers, state) do
#    observers |> Enum.each(&send(&1, state))
#    {observers, state}
#  end
#
#  def attach(subject), do: send(subject, {:attach, self()})
#  def detach(subject), do: send(subject, {:detach, self()})
#
#  def read(subject) do
#    send(subject, {:read, self()})
#    await()
#  end
#
#  def await(millis \\ 1000) do
#    receive do
#      count -> count
#    after
#      millis -> :timeout
#    end
#  end
#
#  def handle_call({:attach, observer_pid}, observers, state) do
#    {observers |> add_observer(observer_pid), state}
#  end
#
#  def handle_call({:detach, observer_pid}, observers, state) do
#    {observers |> remove_observer(observer_pid), state}
#  end
#
#  def handle_call({:read, reader_pid}, observers, state) do
#    send(reader_pid, state)
#    {observers, state}
#  end
#
#  ## Extending
#  def handle_cast({:increment}, observers, state), do: notify(observers, state + 1)
#  def handle_cast({:decrement}, observers, state), do: notify(observers, state - 1)
#
#  def increment(subject), do: send(subject, {:increment})
#  def decrement(subject), do: send(subject, {:decrement})
#
#end

  # subject = %Observable{pid: subject_pid}
  # subject.attach(pid)
  # subject.attach()
  # subject.detach(pid)
  # subject.detach()
  # subject.read()
  # subject.await()
  # subject.increment()
  # subject.decrement()
