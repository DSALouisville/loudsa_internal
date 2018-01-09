defmodule LoudsaInternal.Contact do
  @moduledoc """
  Contacts model any person whom we may wish to contact in the future. Members,
  prospective members, media, other orgs, etc.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias LoudsaInternal.Contact

  schema "contacts" do
    field :first_name, :string
    field :last_name, :string
    field :elected_position, :string
    field :student_status, :string
    field :member_status, :string
    field :member_since, :date
    
    embeds_many :phones, LoudsaInternal.Phone
    embeds_many :emails, LoudsaInternal.Email
    embeds_one :address, LoudsaInternal.Address

    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs \\ %{}) do
    contact
    |> cast(attrs, [:first_name, :last_name, :elected_position, :student_status, :member_status, :member_since])
    |> cast_embed(:phones)
    |> cast_embed(:emails)
    |> cast_embed(:address)
    |> validate_required([:first_name, :last_name])
    |> validate_length(:last_name, min: 2)
  end
end
