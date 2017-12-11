defmodule LoudsaInternal.Repo.Migrations.CreateDeletedContacts do
  use Ecto.Migration

  def change do
    create table(:deleted_contacts) do
      add :name, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end
  end
end
