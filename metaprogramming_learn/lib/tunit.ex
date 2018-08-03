defmodule TUnit do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 27
  """

  defmacro assert({symbol, _, [lhs, rhs]}) do
    quote bind_quoted: [symbol: symbol, lhs: lhs, rhs: rhs] do
      TUnit.Test.test(symbol, lhs, rhs)
    end
  end
end

defmodule TUnit.Test do
  def test(:==, lhs, rhs) when lhs == rhs,
    do: IO.puts "."

  def test(:==, lhs, rhs),
    do: IO.puts "FAIL: #{lhs} is not equal to #{rhs}"

  def test(:>, lhs, rhs) when lhs > rhs,
    do: IO.puts "."
  def test(:>, lhs, rhs),
    do: IO.puts "FAILS: #{lhs} is not higher than #{rhs}"
end
