defmodule Setter do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 19
  """

  @doc """
  If we open iex and run this, prior to calling bind_name,
  we can define `name` = `Tom`.
  bind_name/1 won't change `name` because of the macro hygene.
  If we want to overide this behaviour (and `name`),
  we must specify var!/1 for `name`
  Example:
  """
  defmacro bind_name_hygene(string) do
    quote do
      name = unquote(string)
    end
  end

  @doc """
  If we define `name` = "BoB" in iex and then run
  this function with a different name,
  bind_name_dirty("Tom"), `name` is going to be
  rebinded
  """
  defmacro bind_name_dirty(string) do
    quote do
      var!(name) = unquote(string)
    end
  end
end
