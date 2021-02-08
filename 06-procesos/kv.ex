defmodule KV do
  def start_link do
    Task.start_link(fn -> loops(%{}) end)
  end

  defp loops(map) do
    receive do
      {:read, key, caller} ->
        send(caller, Map.get(map, key))
        loops(map)
      {:update, key, value} -> Map.put(map, key, value) |> loops()
    end
  end

  def request(kv_pid, key) do
    caller = self()
    send(kv_pid, {:read, key, caller})
  end

  def read(kv_pid, key) do
    request(kv_pid, key)
    receive do
      value -> value
    end
  end

  def update(kv_pid, key, value)do
    send(kv_pid, {:update, key, value})
  end

end

{:ok, kv} = KV.start_link()
KV.request(kv, :hello)
value = receive do
  value -> value
end

IO.inspect(value)

value = KV.read(kv, :hello)
IO.inspect(value)

KV.update(kv, :hello, "World2")

KV.request(kv, :hello)
value = receive do
  value -> value
end
IO.puts(value)

value = KV.read(kv, :hello)
IO.puts(value)
###############
Process.register(kv, :my_kv)
value = KV.read(:my_kv, :hello)
IO.inspect(value)

KV.update(:my_kv, :bye, "bye bye")
value
