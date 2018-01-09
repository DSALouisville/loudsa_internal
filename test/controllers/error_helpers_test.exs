defmodule LoudsaInternal.ErrorHelpers.Test do
  use LoudsaInternal.ModelCase

  alias LoudsaInternal.{ErrorHelpers, Contact}

  @short_last_name %{first_name: "Bilbo", last_name: "B", elected_position: "chair", student_status: "student", member_status: "member", member_since: ~D[1937-09-21]}

  test "get_errors returns a name error" do
    {:error, err} = Contact.changeset(%Contact{}, @short_last_name)
    |> Repo.insert
    assert ErrorHelpers.get_errors(err) == [["last_name: should be at least %{count} character(s)"]]
  end
end

