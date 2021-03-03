defmodule KVServerTest.Command do
  use ExUnit.Case
  doctest KVServer.Command

  test "running command invalid" do
    GsObserver.reset(GsObserver)

    cmd = {:x, "hola"}
    assert KVServer.Command.run(cmd) == {:error, "Invalid command: {:x, \"hola\"}\r\n"}

  end

  test "running command" do
    GsObserver.reset(GsObserver)

    cmd = {:incrementar, 100}
    assert KVServer.Command.run(cmd) == {:ok, "ok\r\n"}

    cmd = {:leer, ""}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 100\r\n"}

    cmd = {:decrementar, 50}
    assert KVServer.Command.run(cmd) == {:ok, "ok\r\n"}

    cmd = {:leer, ""}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

  end


  test "running command ignorig secund paramets" do
    GsObserver.reset(GsObserver)

    cmd = {:incrementar, 50}
    assert KVServer.Command.run(cmd) == {:ok, "ok\r\n"}

    cmd = {:leer, ""}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

    cmd = {:leer, "hola"}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

    cmd = {:leer, {}}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

    cmd = {:leer, {"hola", 2}}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

    cmd = {:leer, {2, 2}}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

    cmd = {:leer, 2}
    assert KVServer.Command.run(cmd) == {:ok, "Valor: 50\r\n"}

  end
end
