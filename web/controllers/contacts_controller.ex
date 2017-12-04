defmodule LoudsaInternal.ContactsController do
  use LoudsaInternal.Web, :controller

  alias LoudsaInternal.{Repo, Contact}

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> render "index.html"
  end
end
