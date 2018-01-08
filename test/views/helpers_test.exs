defmodule LoudsaInternal.InputHelpersTest do
  use LoudsaInternal.ConnCase, async: true

  @fields %{
    _a: "a",
    inserted_at: "a",
    updated_at: "a",
    id: "a"
  }

  @fields_2 Map.merge(@fields, %{a: "a"})

  test "clean_fields" do
    assert LoudsaInternal.InputHelpers.clean_fields(@fields) == []
    assert LoudsaInternal.InputHelpers.clean_fields(@fields_2) == [:a]
  end
end
