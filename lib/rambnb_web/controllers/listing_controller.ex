defmodule RambnbWeb.ListingController do
  use RambnbWeb, :controller

  alias Rambnb.Catalog
  alias Rambnb.Catalog.Listing

  def index(conn, params) do
    listings = Catalog.list_listings(params)
    memory_types = ["All", "DDR", "DDR2", "DDR3", "DDR4", "DDR5"]
    usage_types = [
      {"All", "all"},
      {"Gaming", "gaming"},
      {"Work Projects", "work"},
      {"Running Electron and Chrome", "electron"},
      {"Video Editing", "video"},
      {"Chrome Tab Hoarder", "chrome_hoarder"},
      {"Just Browsing", "browsing"}
    ]
    render(conn, :index,
      listings: listings,
      memory_types: memory_types,
      usage_types: usage_types,
      selected_type: params["memory_type"],
      selected_usage: params["usage_type"]
    )
  end

  def new(conn, _params) do
    changeset = Catalog.change_listing(%Listing{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"listing" => listing_params}) do
    case Catalog.create_listing(listing_params) do
      {:ok, listing} ->
        conn
        |> put_flash(:info, "Listing created successfully.")
        |> redirect(to: ~p"/listings/#{listing}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    listing = Catalog.get_listing!(id)
    render(conn, :show, listing: listing)
  end

  def edit(conn, %{"id" => id}) do
    listing = Catalog.get_listing!(id)
    changeset = Catalog.change_listing(listing)
    render(conn, :edit, listing: listing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "listing" => listing_params}) do
    listing = Catalog.get_listing!(id)

    case Catalog.update_listing(listing, listing_params) do
      {:ok, listing} ->
        conn
        |> put_flash(:info, "Listing updated successfully.")
        |> redirect(to: ~p"/listings/#{listing}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, listing: listing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    listing = Catalog.get_listing!(id)
    {:ok, _listing} = Catalog.delete_listing(listing)

    conn
    |> put_flash(:info, "Listing deleted successfully.")
    |> redirect(to: ~p"/listings")
  end
end
