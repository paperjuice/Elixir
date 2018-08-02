defmodule Metaprogramming do


  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)

      result = lhs + rhs
      IO.puts "#{lhs} plus #{rhs} is #{result}"
    end
  end

  defmacro say({:*, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs * rhs
      IO.puts "#{lhs} multiplied by #{rhs} is #{result}"
    end
  end
end
