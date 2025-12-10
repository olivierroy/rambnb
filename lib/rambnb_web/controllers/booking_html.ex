defmodule RambnbWeb.BookingHTML do
  use RambnbWeb, :html

  embed_templates "booking_html/*"

  @doc """
  Renders a booking form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def booking_form(assigns)
end
