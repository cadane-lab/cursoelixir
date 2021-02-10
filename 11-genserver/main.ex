#{:ok, balance} = Balance.create(1000)
#
#Balance.deposit(balance, 100) |> IO.inspect()
#Balance.withdraw(balance, 30) |> IO.inspect()
#Balance.transfer(balance, 80) |> IO.inspect()
#Balance.read(balance) |> IO.inspect()
#
#IO.puts("------------------------")
#
#{:ok, balance} = GsBalance.create(1000)
#
#GsBalance.deposit(balance, 100) |> IO.inspect()
#GsBalance.withdraw(balance, 30) |> IO.inspect()
#GsBalance.transfer(balance, 80) |> IO.inspect()
#GsBalance.read(balance) |> IO.inspect()

#IO.puts("--------------------------")
{:ok, observer} = GsObserver.create(0)
GsObserver.read(observer) |> IO.inspect()
GsObserver.attach(observer) |> IO.inspect()
GsObserver.increment(observer, 100) #|> IO.inspect()
GsObserver.decrement(observer, 10) #|> IO.inspect()
GsObserver.read(observer) |> IO.inspect()
#GsObserver.increment(observer, 1) |> IO.inspect()



{:ok, subject} = Obs.create()
Obs.read(subject)	I> IO.puts()
Obs.attach(subject)
Obs.read(subject)	|> IO.puts()
Obs.increnent(subject)
Obs.await()	|> IO.puts()
Obs.increnent(subject)
Obs.awaft()	|> IO.puts()
Obs.decrenent(subject)
Obs.await()	|> IO.puts()
Obs.detach(subject)
Obs.increnent(subject)
Obs.await()	|> IO.puts()
IO.puts("The counter	is #{Obs.read(subject)}")
