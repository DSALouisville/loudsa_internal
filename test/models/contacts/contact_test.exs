defmodule LoudsaInternal.ContactTest do
  use LoudsaInternal.ModelCase

  alias LoudsaInternal.{Contact, Phone, Email, Address}

  # @fixable_phone %{name: "Bilbo Baggins", email: "bilbo@shire.com", phone: " (502)  000-1234"}
  
  @valid_phone %{number: "(502)555-1234"}
  @valid_email %{address: "bilbo@shire.com"}
  @valid_address %{line_one: "111 Bag End", city: "Hobbiton", state: "SH", zip: 33111}
  @valid_attrs %{first_name: "Bilbo", last_name: "Baggins", elected_position: "chair", student_status: "student", member_status: "member", member_since: ~D[1937-09-21]}
  
  @short_last_name %{first_name: "Bilbo", last_name: "B", elected_position: "chair", student_status: "student", member_status: "member", member_since: ~D[1937-09-21]}
  @bad_email %{address: "bilboshire.com"}
  @bad_phone %{number: "5551234"}

  test "valid changeset" do
    phones_changeset = Phone.changeset(%Phone{}, @valid_phone)
    emails_changeset = Email.changeset(%Email{}, @valid_email)
    address_changeset = Address.changeset(%Address{}, @valid_address)
    contact_changeset = Contact.changeset(%Contact{phones: phones_changeset, emails: emails_changeset, address: address_changeset}, @valid_attrs)
    
    assert contact_changeset.valid?
  end

  test "last name too short" do
    changeset = Contact.changeset(%Contact{}, @short_last_name)
    refute changeset.valid?
  end

  # move to email test?
  test "bad email" do
    emails_changeset = Email.changeset(%Email{}, @bad_email)
    refute emails_changeset.valid?
  end

  # move to phone test?
  test "bad phone" do
    phones_changeset = Phone.changeset(%Phone{}, @bad_phone)
    refute phones_changeset.valid?
  end

end
