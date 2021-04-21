defmodule InmanaWeb.FallbackController do
  # defininindo que é um controller
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
