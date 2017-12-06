defmodule LoudsaInternal.Contact do
  @moduledoc """
  Contacts model any person whom we may wish to contact in the future. Members,
  prospective members, media, other orgs, etc.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias LoudsaInternal.Contact

  schema "contacts" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs \\ %{}) do
    contact
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 5)
    # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
    |> validate_format(:email, ~r/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
  end
end
