defmodule LoudsaInternal.Repo.Migrations.AddEmbedsToContacts do
  use Ecto.Migration

  def change do
    alter table(:contacts) do
      remove :name
      remove :phone
      
      add :first_name, :string
      add :last_name, :string
      add :elected_position, :string
      add :student_status, :string
      add :member_status, :string
      add :member_since, :date

      add :phones, {:array, :map}, default: []
      add :emails, {:array, :map}, default: []
      add :address, :map
    end
  end
end
