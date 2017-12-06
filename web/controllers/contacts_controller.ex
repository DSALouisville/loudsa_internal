defmodule LoudsaInternal.ContactsController do
  use LoudsaInternal.Web, :controller

  alias LoudsaInternal.{Repo, Contact}

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)
    conn
    |> assign(:contact, contact)
    |> render("show.html")
  end

  def create(conn, _params) do
    changeset = Contact.changeset(%Contact{})
    conn
    |> render("create.html", changeset: changeset)
  end

  def new(conn, params) do
    params
    |> Map.get("contact")
    |> Contact.changeset
    |> Repo.insert
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> redirect(to: "/contacts")
  end
end
