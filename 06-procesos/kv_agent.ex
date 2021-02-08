defmodule KV do
  def start_link do
    Agent.start_link(fn -> (%{}) end)
  end

  def read(kv_pid, key) do
      Agent.get(kv_pid, fn map -> Map.get(map, key) end)
  end

  def update(kv_pid, key, value)do
    Agent.update(kv_pid, fn map -> Map.put(map, key, value) end)
  end
end

{:ok, kv} = KV.start_link()

value = KV.read(kv, :hello)
IO.inspect(value)

KV.update(kv, :hello, "World2")

value = KV.read(kv, :hello)
IO.puts(value)
