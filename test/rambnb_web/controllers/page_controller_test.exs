defmodule RambnbWeb.PageControllerTest do
  use RambnbWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "RamBnB"
  end
end
