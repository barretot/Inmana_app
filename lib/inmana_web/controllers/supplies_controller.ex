defmodule InmanaWeb.SuppliesController do
  # defininindo que é um controller
  use InmanaWeb, :controller

  alias Inmana.Supply

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:ok)

      # view: oq sera apresetado ao user
      |> render("create.json", supply: supply)
    end
  end
end
