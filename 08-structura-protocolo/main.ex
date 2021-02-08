alias Geometry.{Rectangle, Circle, Shape}

print = fn shape ->
  IO.puts("")
  IO.puts("area(#{inspect shape}) = #{Shape.area(shape)}")
  IO.puts("area(#{inspect shape}) = #{Shape.perimeter(shape)}")
end

rect = %Rectangle{b: 3, h: 4}
print.(rect)


rect = %Rectangle{b: 4}
print.(rect)

circle = %Circle{}
print.(circle)

any = "hola"
print.(any)

#######################
IO.puts(rect.__struct__)
IO.inspect(Map.keys(rect))
