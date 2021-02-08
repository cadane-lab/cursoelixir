f = &(3 * &1 + 1)
odd? = &(rem(&1,2) == 1)

##Una manera
odd?.(f.(4))

## La otra mas rapida
5 |> f.() |> odd?.()
