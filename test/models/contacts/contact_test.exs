defmodule LoudsaInternal.ContactTest do
  use LoudsaInternal.ModelCase

  alias LoudsaInternal.Contact

  @valid_attrs %{name: "Bilbo Baggins", email: "bilbo@shire.com"}
  @short_name %{name: "Bil", email: "bilbo@shire.com"}
  @bad_email %{name: "Bilbo Baggins", email: "bilboshire.com"}

  test "valid changeset" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "name too short" do
    changeset = Contact.changeset(%Contact{}, @short_name)
    refute changeset.valid?
  end

  test "bad email" do
    changeset = Contact.changeset(%Contact{}, @bad_email)
    refute changeset.valid?
  end
end
