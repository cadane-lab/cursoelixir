map = %{:a => 5, 2 => "hello", true => :ok}
IO.puts("map = %{2 => \"map[2]\", :a => #{map[:a]}, true => #{map[true]} }")

map = %{:a => 5, 2 => "hello", 2 => :ok} #
IO.puts(map[:c]) #nill

#Pattern matching
%{2 => b, :a => a} = %{:a => 5, 2 => true}



key = 5
#map = %{a => true, key = "hello"}
#IO.puts(map[key]) #hello


#Operaciones
map = %{:a => 5, 2 => "hello", true => :ok}
Map.get(map, :a) #5

map2 = Map.put(map, :c, 4)
IO.puts(map2 == map) #false

map3 = Map.put(map2, :c, false)
IO.puts(map2 == map3) #false
