defmodule InmanaWeb.WelcomeController do
  # defininindo que é um controller
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: handle_response(conn, message, :ok)

  defp handle_response({:error, message}, conn), do: handle_response(conn, message, :bad_request)

  defp handle_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
