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
    field :phone, :string

    timestamps()
  end

  def clean_phone(phone) when is_binary(phone) do
    phone
    |> String.replace(~r/[^\d]/, "")
  end

  def clean_phone(phone) when is_nil(phone) do
    phone
  end

  @doc false
  def changeset(%Contact{} = contact, attrs \\ %{}) do
    contact
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name])
    |> validate_length(:name, min: 5)
    |> validate_format(:phone, ~r/\([\d]{3}\)[\d]{3}-[\d]{4}/)
    # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
    |> validate_format(:email, ~r/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
  end

end
