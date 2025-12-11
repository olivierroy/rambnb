defmodule RambnbWeb.PageController do
  use RambnbWeb, :controller

  alias Rambnb.Catalog

  def home(conn, _params) do
    top_listings = Catalog.get_top_listings(6)
    render(conn, :home, top_listings: top_listings)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def terms(conn, _params) do
    render(conn, :terms)
  end

  def privacy(conn, _params) do
    render(conn, :privacy)
  end

  def disclaimer(conn, _params) do
    render(conn, :disclaimer)
  end
end
