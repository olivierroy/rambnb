defmodule Rambnb.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rambnb.Catalog` context.
  """

  @doc """
  Generate a listing.
  """
  def listing_fixture(attrs \\ %{}) do
    {:ok, listing} =
      attrs
      |> Enum.into(%{
        available: true,
        brand: "some brand",
        capacity: 42,
        description: "some description",
        image_url: "some image_url",
        location: "some location",
        memory_type: "some memory_type",
        price_per_day: "120.5",
        speed: "some speed",
        title: "some title"
      })
      |> Rambnb.Catalog.create_listing()

    listing
  end
end
