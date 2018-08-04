defmodule TUnit do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 27
  """

  @doc """
  Page 36
  """
  defmacro __using__(_opt \\ []) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :tests, accumulate: true)

      @before_compile unquote(__MODULE__)
    end
  end

  @doc """
  Page 40
  """
  defmacro __before_compile__(_env) do
    quote do
      def run do
        IO.puts "Running the tests... #{inspect @tests}"
      end
    end
  end

  defmacro test(description, do: block) do
    test_name = String.to_atom(description)
    quote do
      @tests {unquote(test_name), unquote(description)}

      def unquote(test_name)() do
        unquote(block)
      end
    end
  end

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
