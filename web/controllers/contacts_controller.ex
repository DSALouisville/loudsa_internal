defmodule LoudsaInternal.ContactsController do
  use LoudsaInternal.Web, :controller

  alias LoudsaInternal.{Repo, Contact, DeletedContact, ErrorHelpers}

  def to_atoms(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> render("index.html")
  end

  def update(conn, params) do
    IO.inspect(params)
    old_contact = Repo.get!(Contact, params["id"])
                  |> IO.inspect
    new_contact = Ecto.Changeset.change(old_contact, to_atoms(params["contact"]))
                  |> IO.inspect
    IO.inspect Repo.update new_contact
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)
    conn
    |> assign(:contact, contact)
    |> render("show.html", changeset: Contact.changeset(contact), contact: contact)
  end

  def create(conn, _params) do
    changeset = Contact.changeset(%Contact{})
    conn
    |> render("create.html", changeset: changeset)
  end

  def delete(conn, %{"id" => id} = params) do
    contact = Repo.get(Contact, id)
    Repo.delete(contact)
    changeset = DeletedContact.changeset(%DeletedContact{}, Map.from_struct(contact))
    Repo.insert(changeset)
    contacts = Repo.all(Contact)
    conn
    |> assign(:contacts, contacts)
    |> render("index.html")
  end

  def new(conn, %{"contact" => contact}) do
    changeset = Contact.changeset(%Contact{}, contact)
    insert_result = changeset |> Repo.insert
    case insert_result do
      {:ok, _} ->
        contacts = Repo.all(Contact)
        conn
        |> assign(:contacts, contacts)
        |> put_flash(:info, "Created contact #{contact["name"]}")
        |> redirect(to: "/contacts")
      {:error, err} ->
        conn
        |> put_flash(:error, ErrorHelpers.get_errors(err))
        |> render("create.html", changeset: Contact.changeset(%Contact{}, contact))
    end
  end
end
