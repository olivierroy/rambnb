defmodule Rambnb.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Rambnb.Repo

  alias Rambnb.Catalog.Listing

  @doc """
  Returns the list of listings.

  ## Examples

      iex> list_listings()
      [%Listing{}, ...]

  """
  def list_listings(params \\ %{}) do
    query = from l in Listing, where: l.available == true, order_by: [desc: l.inserted_at]

    query = case params["memory_type"] do
      nil -> query
      "All" -> query
      "" -> query
      type -> from l in query, where: l.memory_type == ^type
    end

    query = case params["usage_type"] do
      nil -> query
      "all" -> query
      "" -> query
      "gaming" -> from l in query, where: l.capacity >= 16
      "work" -> from l in query, where: l.capacity >= 8 and l.capacity <= 32
      "electron" -> from l in query, where: l.capacity >= 16
      "video" -> from l in query, where: l.capacity >= 32
      "chrome_hoarder" -> from l in query, where: l.capacity >= 32
      "browsing" -> from l in query, where: l.capacity >= 4 and l.capacity <= 16
      _ -> query
    end

    Repo.all(query)
  end

  @doc """
  Gets a single listing.

  Raises `Ecto.NoResultsError` if the Listing does not exist.

  ## Examples

      iex> get_listing!(123)
      %Listing{}

      iex> get_listing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_listing!(id), do: Repo.get!(Listing, id)

  @doc """
  Returns the top listings for the homepage.
  """
  def get_top_listings(limit \\ 6) do
    from(l in Listing,
      where: l.available == true,
      order_by: [desc: l.capacity, desc: l.price_per_day],
      limit: ^limit
    )
    |> Repo.all()
  end

  @doc """
  Creates a listing.

  ## Examples

      iex> create_listing(%{field: value})
      {:ok, %Listing{}}

      iex> create_listing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_listing(attrs \\ %{}) do
    %Listing{}
    |> Listing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a listing.

  ## Examples

      iex> update_listing(listing, %{field: new_value})
      {:ok, %Listing{}}

      iex> update_listing(listing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_listing(%Listing{} = listing, attrs) do
    listing
    |> Listing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a listing.

  ## Examples

      iex> delete_listing(listing)
      {:ok, %Listing{}}

      iex> delete_listing(listing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_listing(%Listing{} = listing) do
    Repo.delete(listing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking listing changes.

  ## Examples

      iex> change_listing(listing)
      %Ecto.Changeset{data: %Listing{}}

  """
  def change_listing(%Listing{} = listing, attrs \\ %{}) do
    Listing.changeset(listing, attrs)
  end
end
