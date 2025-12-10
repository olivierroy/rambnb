defmodule RambnbWeb.ListingHTML do
  use RambnbWeb, :html

  embed_templates "listing_html/*"

  @doc """
  Renders a listing form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def listing_form(assigns)
end
