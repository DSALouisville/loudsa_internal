defmodule LoudsaInternal.Address do
    @moduledoc """
    Address struct for contacts' addresses.
    """
    
    use Ecto.Schema
    import Ecto.Changeset
    alias LoudsaInternal.Address

    @primary_key false
    embedded_schema do
        field :line_one, :string
        field :line_two, :string
        field :city, :string
        field :state, :string
        field :zip, :integer
    end

    @doc false
    def changeset(%Address{} = address, attrs \\ %{}) do
        address
        |> cast(attrs, [:line_one, :line_two, :city, :state, :zip])
        |> validate_required([:line_one, :city, :state, :zip])
    end
end