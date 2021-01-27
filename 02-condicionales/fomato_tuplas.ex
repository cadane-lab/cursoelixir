list = [1, 2]
list2 = list + [3, 4]

list3 = [a: 1, b:5]
list4 = list3 + [{:c, 3}, {:d, 4}]
Enum.at(list4, 0)

[{:a, z}] = [a: 1]
