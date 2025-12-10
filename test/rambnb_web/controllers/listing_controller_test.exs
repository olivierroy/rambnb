defmodule RambnbWeb.ListingControllerTest do
  use RambnbWeb.ConnCase

  import Rambnb.CatalogFixtures

  @create_attrs %{available: true, brand: "some brand", capacity: 42, description: "some description", image_url: "some image_url", location: "some location", memory_type: "some memory_type", price_per_day: "120.5", speed: "some speed", title: "some title"}
  @update_attrs %{available: false, brand: "some updated brand", capacity: 43, description: "some updated description", image_url: "some updated image_url", location: "some updated location", memory_type: "some updated memory_type", price_per_day: "456.7", speed: "some updated speed", title: "some updated title"}
  @invalid_attrs %{available: nil, brand: nil, capacity: nil, description: nil, image_url: nil, location: nil, memory_type: nil, price_per_day: nil, speed: nil, title: nil}

  describe "index" do
    test "lists all listings", %{conn: conn} do
      conn = get(conn, ~p"/listings")
      assert html_response(conn, 200) =~ "Listing Listings"
    end
  end

  describe "new listing" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/listings/new")
      assert html_response(conn, 200) =~ "New Listing"
    end
  end

  describe "create listing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/listings", listing: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/listings/#{id}"

      conn = get(conn, ~p"/listings/#{id}")
      assert html_response(conn, 200) =~ "Listing #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/listings", listing: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Listing"
    end
  end

  describe "edit listing" do
    setup [:create_listing]

    test "renders form for editing chosen listing", %{conn: conn, listing: listing} do
      conn = get(conn, ~p"/listings/#{listing}/edit")
      assert html_response(conn, 200) =~ "Edit Listing"
    end
  end

  describe "update listing" do
    setup [:create_listing]

    test "redirects when data is valid", %{conn: conn, listing: listing} do
      conn = put(conn, ~p"/listings/#{listing}", listing: @update_attrs)
      assert redirected_to(conn) == ~p"/listings/#{listing}"

      conn = get(conn, ~p"/listings/#{listing}")
      assert html_response(conn, 200) =~ "some updated brand"
    end

    test "renders errors when data is invalid", %{conn: conn, listing: listing} do
      conn = put(conn, ~p"/listings/#{listing}", listing: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Listing"
    end
  end

  describe "delete listing" do
    setup [:create_listing]

    test "deletes chosen listing", %{conn: conn, listing: listing} do
      conn = delete(conn, ~p"/listings/#{listing}")
      assert redirected_to(conn) == ~p"/listings"

      assert_error_sent 404, fn ->
        get(conn, ~p"/listings/#{listing}")
      end
    end
  end

  defp create_listing(_) do
    listing = listing_fixture()
    %{listing: listing}
  end
end
