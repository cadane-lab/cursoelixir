defmodule KVServer.Command do
  require Logger

  def run(command)do

    case command do
      {:leer, _} -> {:ok, "Valor: #{GsObserver.read(GsObserver)}\r\n"}
      {:incrementar, parametro} -> {:ok, "#{GsObserver.increment(GsObserver, parametro)}\r\n"}
      {:decrementar, parametro} -> {:ok, "#{GsObserver.decrement(GsObserver, parametro)}\r\n"}
      _ -> {:error, "Invalid command: #{inspect command}\r\n"}
    end

  end

  def parse(msg) do

    comando = String.split(msg, " ") |> Enum.at(0)
    parametroCrudo = String.split(msg, " ") |> Enum.at(1)

    try do
      parametro = cond do
        parametroCrudo != nil -> String.replace(parametroCrudo,"\r\n","") |> String.to_integer
        true -> nil #Rquiere para cuando ninguna se cumpla
      end

      case comando do
        "leer\r\n" -> {:ok, {:leer, ""}}
        "suma" -> {:ok, {:incrementar, parametro}}
        "resta" -> {:ok, {:decrementar, parametro}}
        _ ->
          {:error, :unknown_command}
      end

    rescue
      ArgumentError -> {:error, :params_invalid}
    end


    #case msg do
    #  "boom\r\n" -> {:error, :unknown_command}
    #  _ -> {:ok, msg}
    #end
  end
end
