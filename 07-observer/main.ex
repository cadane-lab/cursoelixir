alias Observable

subject = Observable.create()

IO.puts(Observable.read(subject))

Observable.attach(subject)

Observable.increment(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.decrement(subject)
IO.puts(Observable.await())

Observable.increment(subject)
IO.puts(Observable.await())

Observable.detach(subject)
Observable.increment(subject)
IO.puts(Observable.await())

#IO.puts("------------------------------")
#subject = Obs.create()
#
#IO.puts(Obs.read(subject))
#
#Obs.attach(subject)
#
#Obs.increment(subject)
#IO.puts(Obs.await())
#
#Obs.increment(subject)
#IO.puts(Obs.await())
#
#Obs.decrement(subject)
#IO.puts(Obs.await())
#
#Obs.increment(subject)
#IO.puts(Obs.await())
#
#Obs.detach(subject)
#Obs.increment(subject)
#IO.puts(Obs.await())
