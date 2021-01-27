IO.puts("____________________________")
#Tuplas
{a, b, c} = {1, "hello", :ok}
{a, _, c} = {1, "hello", :ok} #"hello" es ignorado

b = true
{a, ^b, _} = {1, true, "ok"} #b es comparado con true

b = false
{a, ^b, _} = {1, true, "ok"} #genera error

IO.puts("____________________________")
#Listas
[a, b, c] = [1, "hello", :ok]
[a, _, c] = [1, "hello", :ok] #"hello" es ignorado

b = true
[a, ^b, _] = [1, true, "ok"] #b es comparado con true

b = false
[a, ^b, _] = [1, true, "ok"] #genera error
[head | tail] = [] #genera MacthError
[head | tail] = [5.0] #h = 5.0 t= []
[head | tail] = [5.0, 3] #h = 5 t = [3]
[head | tail] = [5.0, 3, :ok] #h=5 t= [3, :ok]

[1 | tail] = [1, 2, 3] #t = [2, 3]
[2 | tail] = [1, 2, 3] #genera MacthError

a=1
[^a | tail] = [1, 2, 3] # t = [2, 3]

a=2
[^a | tail] = [1, 2, 3] #genera MacthError
