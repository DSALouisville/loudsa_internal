defmodule LoudsaInternal.Email do
    @moduledoc """
    Email struct for contacts' emails.
    """
    
        use Ecto.Schema
        import Ecto.Changeset
        alias LoudsaInternal.Email
    
        @primary_key false
        embedded_schema do
            field :address, :string
        end

        @doc false
        def changeset(%Email{} = email, attrs \\ %{}) do
            email
            |> cast(attrs, [:address])
            |> validate_required([:address])
            # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
            |> validate_format(:address, ~r/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)
        end
    end
      