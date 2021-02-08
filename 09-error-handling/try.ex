IO.puts("Seccion uno")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a rutine error")
  ArithmeticError -> IO.puts("The division was not possible")
end

IO.puts("Seccion dos")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a rutine error")
  e in ArithmeticError -> IO.puts("Este es el error: #{e}")
end

IO.puts("Seccion tres")
try do
  raise CustomError, message: "My custom error"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, countrty: #{e.country}")
end

try do
  raise CustomError, message: "My custom error", country: "Colombia"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, countrty: #{e.country}")
end

IO.puts("Seccion cuatro--------------------------")
try do
  IO.puts("Esto no es un error")
rescue
  _ -> IO.puts("Esto nunca se muestra")
after
  IO.puts("Se muestra de todas formas")
end

try do
  raise "Esto da error"
rescue
  _ -> IO.puts("Esto se muestra en el error")
after
  IO.puts("Se muestra de todas formas")
end


IO.puts("Seccion cinco--------------------------------")

try do
  raise "Esto da error"
catch
  e -> IO.puts("Esto se muestra en el error #{e}")
after
  IO.puts("Se muestra de todas formas")
end

try do
  throw(453_637)
  IO.puts("Esto nunca se pinta")
catch
  e -> IO.puts("esto es el catch #{e}")
after
  IO.puts("Se muestra de todas formas")
end

IO.puts("Seccion seis------------------------------")

try do
  raise "Hola"
  IO.puts("No se pinta")
rescue
  e -> IO.puts("Desde rescue #{e}")
catch

after

  try do
  raise "Hola"
  IO.puts("No se pinta")
rescue
  e -> IO.puts("Desde rescue #{e}")
catch

after

end

try do
  raise "Hola"
  IO.puts("No se pinta")
rescue
  e -> IO.puts("Desde rescue #{e}")
catch
  e -> IO.puts("desde el catch #{e}")
after
  IO.puts("Se pinta de todas formas")
end

IO.puts("Seccion siete------------------------------")
try do
  throw(nil)
  IO.puts("No se pinta")
rescue
  e -> IO.puts("Desde rescue #{e}")
catch
  e -> IO.puts("desde el catch #{e}")
after
  IO.puts("Se pinta de todas formas")
end


IO.puts("Seccion ocho------------------------------")
try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: raise("Oops! x == 10")
  end)
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch #{e}")
after
  IO.puts("Se pinta de todas maneras")
end

sum = try do
  1..20 |> Enum.reduce(0, fn h, acc ->
    if rem(h, 13) == 0 do
      #raise acc
      throw(acc)
    else
      h + acc
    end
  end)
#rescue
#  e in RuntimeError -> e.message
catch
  acc -> acc
end
IO.puts(sum)

#####
x = 10
how = fn x ->
  try do
    1 / x
  rescue
    ArithmeticError -> {:bad :infinity}
  else
    d when d < 1 and b > -1 -> :small
    d when d < 10 and b > -10 -> :meddle
    _ -> :large
  end
end


how_number = fn x ->
  try do
    1 / x
  rescue
    ArithmeticError -> {:bad :infinity}
  else
    d when d < 1 and b > -1 -> :small
    d when d < 10 and b > -10 -> :meddle
    _ -> :large
  after
    IO.puts("Hola")
  end
end

how_number(0)
how_number(1)
how_number(2)

a = spawn_link(fn ->
  receive do
    msg -> IO.puts(msg)
  end
end)
IO.puts(Process.alive?(a))#true

send(a, "hola")
IO.puts(Process.alive?(a))#false

####
a = spawn_link(fn ->
  exit(1)
  receive do
    msg -> IO.puts(msg)
  end
end)
IO.puts(Process.alive?(a))#false
