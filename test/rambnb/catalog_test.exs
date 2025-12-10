defmodule Rambnb.CatalogTest do
  use Rambnb.DataCase

  alias Rambnb.Catalog

  describe "listings" do
    alias Rambnb.Catalog.Listing

    import Rambnb.CatalogFixtures

    @invalid_attrs %{available: nil, brand: nil, capacity: nil, description: nil, image_url: nil, location: nil, memory_type: nil, price_per_day: nil, speed: nil, title: nil}

    test "list_listings/0 returns all listings" do
      listing = listing_fixture()
      assert Catalog.list_listings() == [listing]
    end

    test "get_listing!/1 returns the listing with given id" do
      listing = listing_fixture()
      assert Catalog.get_listing!(listing.id) == listing
    end

    test "create_listing/1 with valid data creates a listing" do
      valid_attrs = %{available: true, brand: "some brand", capacity: 42, description: "some description", image_url: "some image_url", location: "some location", memory_type: "some memory_type", price_per_day: "120.5", speed: "some speed", title: "some title"}

      assert {:ok, %Listing{} = listing} = Catalog.create_listing(valid_attrs)
      assert listing.available == true
      assert listing.brand == "some brand"
      assert listing.capacity == 42
      assert listing.description == "some description"
      assert listing.image_url == "some image_url"
      assert listing.location == "some location"
      assert listing.memory_type == "some memory_type"
      assert listing.price_per_day == Decimal.new("120.5")
      assert listing.speed == "some speed"
      assert listing.title == "some title"
    end

    test "create_listing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_listing(@invalid_attrs)
    end

    test "update_listing/2 with valid data updates the listing" do
      listing = listing_fixture()
      update_attrs = %{available: false, brand: "some updated brand", capacity: 43, description: "some updated description", image_url: "some updated image_url", location: "some updated location", memory_type: "some updated memory_type", price_per_day: "456.7", speed: "some updated speed", title: "some updated title"}

      assert {:ok, %Listing{} = listing} = Catalog.update_listing(listing, update_attrs)
      assert listing.available == false
      assert listing.brand == "some updated brand"
      assert listing.capacity == 43
      assert listing.description == "some updated description"
      assert listing.image_url == "some updated image_url"
      assert listing.location == "some updated location"
      assert listing.memory_type == "some updated memory_type"
      assert listing.price_per_day == Decimal.new("456.7")
      assert listing.speed == "some updated speed"
      assert listing.title == "some updated title"
    end

    test "update_listing/2 with invalid data returns error changeset" do
      listing = listing_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_listing(listing, @invalid_attrs)
      assert listing == Catalog.get_listing!(listing.id)
    end

    test "delete_listing/1 deletes the listing" do
      listing = listing_fixture()
      assert {:ok, %Listing{}} = Catalog.delete_listing(listing)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_listing!(listing.id) end
    end

    test "change_listing/1 returns a listing changeset" do
      listing = listing_fixture()
      assert %Ecto.Changeset{} = Catalog.change_listing(listing)
    end
  end
end
