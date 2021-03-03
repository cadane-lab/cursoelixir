defmodule RedsocialWeb.PageController do
  use RedsocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
