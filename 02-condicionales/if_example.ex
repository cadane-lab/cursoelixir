result = if true do
  "Esto retorna un valor"
end
IO.puts(result)

result = if false do
  "Esto retorna un valor"
  #else
  #nil
end
IO.puts(result)

#evaluate = fn x ->
#  if x do
#    "Truhty"
#  else
#    "Falsy"
#  end
#end
evaluate = fn x ->
  if x, do: "Truhty", else: "Falsy"
end

#evaluate2 =  fn x ->
#  unless x do
#    "Falsy"
#  else
#    "Truhty"
#  end
#end
evaluate2 =  fn x ->
  unless x, do: "Falsy", else: "Truhty"
end

valor = true
IO.puts("evaluate.(#{valor}) = #{evaluate.(valor)}")
IO.puts("evaluate2.(#{valor}) = #{evaluate2.(valor)}")
