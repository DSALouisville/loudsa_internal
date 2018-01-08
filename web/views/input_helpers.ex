defmodule LoudsaInternal.InputHelpers do
  @moduledoc """
  Generate forms with <%= input f :type %>
  """
  use Phoenix.HTML

  alias LoudsaInternal.ErrorHelpers
  alias Phoenix.HTML.Form

  @doc """
  Cleans list of fields to "human readable" ones
  """
  def clean_fields(map) do
    Enum.filter(Map.keys(map), fn(x) ->
      !String.starts_with?(Atom.to_string(x), "_") &&
      !Enum.member?([:id, :inserted_at, :updated_at], x)
    end)
  end

  def input(form, field, opts \\ []) do
    type = Form.input_type(form, field)

    wrapper_opts = [class: "form-group #{state_class(form, field)}"]
    label_opts = [class: "control-label"]
    input_opts = [class: "form-control"]
    validations = Form.input_validations(form, field)
    input_opts = Keyword.merge(validations, input_opts)

    content_tag :div do
      label = label(form, field, humanize(field), label_opts)
      input = input(type, form, field, input_opts)
      error = ErrorHelpers.error_tag(form, field) || ""
      [label, input, error || ""]
    end
  end

  defp state_class(form, field) do
    cond do
      # The form was not yet submitted
      !form.source.action -> ""
      form.errors[field] -> "has-error"
      true -> "has-success"
    end
  end

  defp input(:phone, form, field, input_opts) do
    raise "not yet implemented"
  end

  defp input(type, form, field, input_opts) do
    apply(Form, type, [form, field, input_opts])
  end
end
