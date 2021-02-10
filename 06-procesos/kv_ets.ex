defmodule Kv_ets do
  def start_link do
    :ets.new(:my_bucket, [:set, :protected])
  end

  def read(kv_pid, key) do
    case :ets.lookup(kv_pid, key) do
      [] -> nil
      [{_, value}] -> value
    end
  end

  def insert_or_update(kv_pid, key, value)do
    :ets.insert(kv_pid, {key, value})
  end
end

kv = Kv_ets.start_link()

#value = Kv_ets.read(kv, :name)
#IO.inspect(value)
#IO.puts(value)

Kv_ets.insert_or_update(kv, :name, "Camel")
Kv_ets.insert_or_update(kv, :lastname, "Negrete")

nombre = Kv_ets.read(kv, :name)
apellido = Kv_ets.read(kv, :lastname)

#IO.inspect(nombre)
#IO.inspect(apellido)
IO.puts("#{nombre} #{apellido}")
