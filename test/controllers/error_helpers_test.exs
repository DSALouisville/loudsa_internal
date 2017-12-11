defmodule LoudsaInternal.ErrorHelpers.Test do
  use LoudsaInternal.ModelCase

  alias LoudsaInternal.{ErrorHelpers, Contact}

  @short_name %{name: "Bil", email: "bilbo@shire.com", phone: "(502)555-1234"}

  test "get_errors returns a name error" do
    {:error, err} = Contact.changeset(%Contact{}, @short_name)
    |> Repo.insert
    assert ErrorHelpers.get_errors(err) == [["name: should be at least %{count} character(s)"]]
  end
end

