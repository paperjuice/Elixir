defmodule Mime do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 46
  """

  # Page 48, whenever we make changes to this file,
  # those changes will be picked and if we
  # recompile, we will generate functions based on
  # the new state of the external file

  @external_resource mimes_path = Path.join([__DIR__, "/application.csv"])

  for line <- File.stream!(mimes_path, [], :line) do
    [name, template, _reference] =
      line
      |> String.trim()
      |> String.split(",")

    @doc """
    'unquote' outside 'quote do' is called 'unquote fragment'
    """
    def get_template_by_name(unquote(name)), do: [unquote(template)]
    def get_name_by_template(unquote(template)), do: unquote(name)
  end

  def get_template_by_name(_name), do: []
  def get_name_by_template(_template), do: []
  def is_valid_mime?(name), do: get_template_by_name(name) |> Enum.any?
end
