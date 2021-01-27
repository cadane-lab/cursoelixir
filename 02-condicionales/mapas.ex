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

#%{map | :c => "byte"} #Error porque :c no esta e el mapa
map4 = %{map | :a => "byte"} #
IO.puts(map4 == map) #false

user = [
  Frank: %{lastname: "Moreno", country: "Peru"},
  #Frank: %{:lastname => "Moreno", country: => "Peru"}
  Juan: %{lastname: "Meza", country: "Colombia"}
]

IO.puts(user[:Frank].lastname) #Moreno
#user.frank  #Genera error
