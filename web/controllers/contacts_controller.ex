defmodule LoudsaInternal.ContactsController do
  use LoudsaInternal.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
