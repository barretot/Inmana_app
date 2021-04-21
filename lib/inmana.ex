defmodule Inmana do
  alias Inmana.Restaurant.Create, as: RestaurantCreate
  alias Inmana.Supplies.Create, as: SupplyCreate

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
end
