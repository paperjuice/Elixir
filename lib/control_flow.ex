defmodule Metaprogramming.ControlFlow do

  defmacro unless(statement, do: block) do
    quote do
      if !unquote(statement) do
        unquote(block)
      end
    end
  end
end
