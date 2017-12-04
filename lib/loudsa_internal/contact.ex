defmodule LoudsaInternal.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias LoudsaInternal.Contact


  schema "contacts" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs) do
    contact
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
