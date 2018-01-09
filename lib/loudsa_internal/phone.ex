defmodule LoudsaInternal.Phone do
@moduledoc """
Phone struct for contacts' phones.
"""

    use Ecto.Schema
    import Ecto.Changeset
    alias LoudsaInternal.Phone

    @primary_key false
    embedded_schema do
        field :number, :string
    end

    @doc false
    def changeset(%Phone{} = phone, attrs \\ %{}) do
        phone
        |> cast(attrs, [:number])
        |> validate_required([:number])
        |> validate_format(:number, ~r/\([\d]{3}\)[\d]{3}-[\d]{4}/)
    end

    def clean_phone(phone) when is_binary(phone) do
        phone
        |> String.replace(~r/[^\d]/, "")
    end

    def clean_phone(phone) when is_nil(phone) do
        phone
    end
end
  