defmodule Mime do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 46
  """

  for line <- File.stream!([__DIR__, "/application.csv"], [], :line) do
    [name, template, reference] =
      line
      |> String.trim()
      |> String.split(",")

    def get_template_by_name(unquote(name)), do: unquote(template)
    def get_name_by_template(unquote(template)), do: unquote(name)
  end

  def get_template_by_name(_name), do: []
  def get_name_by_template(_template), do: []
end
