#Intergers
n = 102
n_hex = 0x41 #= 65
n_octal = 0o24 # = 20

IO.puts("a = #{n}, b = #{n_hex}, c = #{n_octal}")
#q = div (35, 4) #8
#r = rem (35, 4) #3

#Float
x = 2.71
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")


x = 276.5e-2
IO.puts("round(#{x}) = #{round(x)}")
IO.puts("trunc(#{x}) = #{trunc(x)}")

#Number (Interger and Floats)
IO.puts("(1 == 1.0) = #{1 == 1.0}")
IO.puts("(1 != 1.0) = #{1 != 1.0}")
IO.puts("(1 === 1.0) = #{1 === 1.0}")
IO.puts("(1 !== 1.0) = #{1 !== 1.0}")
IO.puts("(1.0 < 2) = #{1.0 < 2}")
IO.puts("(1.0 <= 2) = #{1.0 <= 2}")
IO.puts("(2.0 <= 2) = #{2.0 <= 2}")
IO.puts("(1.0 > 2) = #{1.0 > 2}")
IO.puts("(1.0 >= 2) = #{1.0 >= 2}")
IO.puts("(2.0 >= 2) = #{2.0 >= 2}")




#Bolean
isOpen = true #false
t = true
f = false
IO.puts("AND TABLE")
IO.puts("#{f} and #{f} = #{f and f}")
IO.puts("#{f} and #{t} = #{f and t}")
IO.puts("#{t} and #{f} = #{t and f}")
IO.puts("#{t} and #{t} = #{t and t}")
IO.puts("--------------------------")


IO.puts("=======================")
text = "Pingüino"
IO.puts(text)
IO.puts("is_binary(\"#{text} \") = #{is_binary(text)}")
n = String.length(text)
IO.puts("is_binary(#{n}) = #{is_binary(n)}")
IO.puts("String.length(\"#{text} \") = #{n}")
IO.puts("byte_size(\"#{text} \") = #{byte_size(text)}")

IO.puts(String.upcase(text))

IO.puts("=======================")
atom = :my_atom
atom2 = MyAtom
IO.puts("is_atom(4) = #{is_atom(4)}")
IO.puts("is_atom(#{atom}) = #{is_atom(atom)}")
IO.puts("is_boolean(#{atom}) = #{is_boolean(atom)}")
IO.puts("is_atom(#{atom2}) = #{is_atom(atom2)}")
IO.puts("is_boolean(#{atom2}) = #{is_boolean(atom2)}")

t = true
f = false
IO.puts("is_atom(#{t}) = #{is_atom(t)}")
IO.puts("is_atom(#{f}) = #{is_atom(f)}")
IO.puts("(:true == true) = #{:true == true}")
IO.puts("(:false == false) = #{:false == false}")

IO.puts("#{:ok}")
IO.puts("#{:error}")

IO.puts("=======================")
add = fn (x, y)->
  x + y
end

sub = fn x, y-> x - y end

s = add.(1,2)
r = sub.(5, 3)

IO.puts("is_function(add) = #{is_function(add)}")
IO.puts("is_function(sub) = #{is_function(sub)}")
IO.puts("add.(1, 2) = #{s}")
IO.puts("sub.(5, 3) = #{r}")
#arridad de las funciones
IO.puts("is_function(add, 0) = #{is_function(add, 0)}")
IO.puts("is_function(add, 1) = #{is_function(add, 1)}")
IO.puts("is_function(add, 2) = #{is_function(add, 2)}")

#double fn x -> add.(x, x) end
#IO.puts("double.(5) = #{double.(5)}")

five = (fn x -> x + 1 end).(4)
IO.puts("five = #{five}")


IO.puts("=======================")
list = [1, "hola", 2.3, false]
IO.inspect(list)
IO.puts("length(list) = #{length list}")

list = [1, "hola"] ++ [4, "y", :hello]
IO.inspect(list)
IO.puts("length(list) = #{length list}")

IO.puts("hd(list) = #{hd(list)}")
IO.puts("tl(list) = ")
IO.inspect(tl(list))


IO.puts("=======================")
tupla = {1, "4", 3.0, true, :error}
IO.inspect(tupla)

{a, b, _, c, _} = tupla
IO.puts("a = #{a}, b = #{b}, c = #{c}")

IO.inspect(put_elem(tupla, 2, :ok))
IO.inspect(tupla)

#result = File.read("01holamundo/hello.ex")
#IO.inspect(result)
#IO.puts("elem(result, 0) = #{elemn(result, 0)}")

#result = File.read("hello.ex")
#IO.inspect(result)
#IO.puts("elem(result, 0) = #{elemn(result, 0)}")

IO.puts("--------------------------------")
a = [1,4,2,3,7,5,6,9,3,2,8]
b = [3,2,20,5]
IO.puts("a -- b = ")
IO.inspect(a -- b)

IO.puts("-------------------------------")
IO.puts ("4 in [3, 4] #{4 in [3, 4]}")
IO.puts ("4 not in [3, 4] #{4 not in [3, 4]}")
IO.puts ("5 in [3, 4] #{5 in [3, 4]}")
IO.puts ("5 not in [3, 4] #{5 not in [3, 4]}")
