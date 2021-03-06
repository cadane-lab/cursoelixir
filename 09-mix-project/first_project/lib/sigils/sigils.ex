defmodule Sigil do
  def example1 do
    regex = ~r/foo|bar/
    IO.puts("foo" =~ regex) #true
    IO.puts("bar" =~ regex) #false

    "HELLO" =~ ~r/hello/ #false
    "HELLO" =~ ~r/hello/i #true
  end

  def exampl2 do
    IO.puts(~r/hello/)
    IO.puts(~r|hello|)
    IO.puts(~r<hello>)
    IO.puts(~r"hello")
    IO.puts(~r'hello')
    IO.puts(~r(hello))
    IO.puts(~r[hello])
    IO.puts(~r{hello})
  end

  def parse_url do
    url = "https://www.google.com"
    regex_url_1 = ~r<^https?://>
    regex_url_2 = ~r/^https?:\/\//
    IO.puts(regex_url_1 === regex_url_2) #true
    IO.puts(url =~ regex_url_1)
  end

  def string_sigils do
    #####
  end

  def charlist_sigils do
    IO.puts('hello')
    IO.puts(~c(hello))
  end

  def calendar_sigils do
    date1 = ~D[2021-02-05]
    date2 = %Date{year: 2021, month: 2, day: 5}
    IO.puts(date1 === date2) #true

    t1 = ~T[14:31:53.0]
    t2 = ~T[14:31:53]
    t3 = %Time{hour: 14, minute: 31, second: 53}
    IO.puts(t1 === t2)#false
    IO.puts(t2 === t3)#true

    ndt = ~N[2021-02-05 14:31:53.0]
    IO.inspect(Map.keys(ndt))
    IO.inspect(Map.values(ndt))

    dt = ~U[2021-02-05 14:31:53Z]
    %DateTime{minute: m, time_zone: tz, utc_offset: uo, std_offset: so} = dt
    IO.puts(m)
    IO.puts(tz)
    IO.puts(uo)
    IO.puts(so)
  end

  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: -String.to_integer(string)
  def sigil_i(string, [?a]), do: string |> String.to_integer() |> abs()
end
