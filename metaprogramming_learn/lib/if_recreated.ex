defmodule IfRecreated do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCoord, page: 22
  """

  defmacro if(statement, do: block, else: else_block) do
    quote do
      case unquote(statement) do
        x when x in [nil, false] -> unquote(else_block)
        _ -> unquote(block)
      end
    end
  end
end
