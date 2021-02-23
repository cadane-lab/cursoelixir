defmodule Weather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Weather.Repo,
      # Starts a worker by calling: Weather.Worker.start_link(arg)
      # {Weather.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Weather.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defmodule Sample.Repo do
    use Ecto.Repo,
      otp_app: :my_app,
      adapter: Ecto.Adapters.Postgres
  end

  defmodule Sample.Weather do
    use Ecto.Schema

    schema "weather" do
      field :city,    :string
      field :temp_lo, :integer
      field :temp_hi, :integer
      field :prcp,    :float, default: 0.0
    end
  end

  #defmodule Sample.App do
    import Ecto.Query
    alias Sample.{Weather, Repo}

    def keyword_query do
      query =
        from w in Weather,
             where: w.prcp > 0 or is_nil(w.prcp),
             select: w

      Repo.all(query)
    end

    def pipe_query do
      Weather
      |> where(city: "Monteria")
      |> order_by(:temp_lo)
      |> limit(10)
      |> Repo.all
    end
  #end
end
