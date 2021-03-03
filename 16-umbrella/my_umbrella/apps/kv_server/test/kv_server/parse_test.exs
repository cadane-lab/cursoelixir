defmodule KVServerTest.Parse do
  use ExUnit.Case
  doctest KVServer.Command

  test "running parse error" do
    cmd = "suma x\r\n"
    assert KVServer.Command.parse(cmd) == {:error, :params_invalid}

    cmd = "resta x\r\n"
    assert KVServer.Command.parse(cmd) == {:error, :params_invalid}

    cmd = "hola\r\n"
    assert KVServer.Command.parse(cmd) == {:error, :unknown_command}
  end

  test "running parse" do

    cmd = "leer\r\n"
    assert KVServer.Command.parse(cmd) == {:ok, {:leer, ""}}

    cmd = "suma 100\r\n"
    assert KVServer.Command.parse(cmd) == {:ok, {:incrementar, 100}}

    cmd = "resta 100\r\n"
    assert KVServer.Command.parse(cmd) == {:ok, {:decrementar, 100}}


  end
end
