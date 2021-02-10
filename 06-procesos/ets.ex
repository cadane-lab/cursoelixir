table = :ets.new(:my_bucket, [:set, :protected])
:ets.insert(table, {"a", 1}) #true
:ets.insert(table, {"a", 2}) #true
:ets.lookup(table, "a") #[{"a", 2}]
:ets.insert(table, {"a", 1}) #true
:ets.lookup(table, "a") #[{"a", 1}]

###############################

table = :ets.new(:my_bucket, [:bag, :protected])
:ets.insert(table, {"a", 1}) #true
:ets.insert(table, {"a", 2}) #true
:ets.lookup(table, "a") #[{"a", 1}, {"a", 2}]
:ets.insert(table, {"a", 1}) #true
:ets.lookup(table, "a") #[{"a", 1}, {"a", 2}]

################################

table1 = :ets.new(:my_bucket, [:bag, :protected])
:ets.insert(table, {:hello, 1}) #true
:ets.insert(table, {:hello, 2}) #true
:ets.lookup(table1, :hello) #[{:hello, 1}, {:hello, 2}]
spawn_link(fn -> :ets.lookup(table1, :hello) end)
parent = self()
spawn_link(fn -> send(parent, :ets.lookup(table1, :hello) end))
receive do
  x -> x
end #[hello: 1, hello: 2]
spawn_link(fn -> send(parent, :ets.insert(table1, {:hello, 3}) end )) #Error no se puede insertar, tabla1 esta protegida

#################################

table1 = :ets.new(:my_bucket, [:bag, :private])
parent = self()
spawn_link(fn -> send(parent, :ets.lookup(table1, "a") end)) #Error, table1 es privado
