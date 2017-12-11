defmodule LoudsaInternal.DeletedContactTest do
  use LoudsaInternal.ModelCase

  alias LoudsaInternal.DeletedContact

  @valid_attrs %{email: "some email", name: "some name", phone: "some phone"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DeletedContact.changeset(%DeletedContact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DeletedContact.changeset(%DeletedContact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
