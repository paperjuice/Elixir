defmodule TUnit do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 27
  """


  # -----------------------------------------------------
  # TODO: make all the asserts in a test return value
  # TODO: assert for every operator in elixir
  # TODO: add boolean assertions such as assert true
  # TODO: implement refute
  # TODO: run tests in parallel via spawned processes
  # TODO: add reports: pass/fail count and execution time
  # Exercises at page 42
  #------------------------------------------------------

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
       TUnit.Test.run(@tests, __MODULE__)
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

  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      TUnit.Test.assert(operator, lhs, rhs)
    end
  end
end

defmodule TUnit.Test do
  def run(test_list, module) do
    Enum.each(test_list, fn {name, _desc} ->
      case apply(module, name, []) do
        {:ok, msg}   -> IO.puts msg
        {:fail, msg} -> IO.puts msg
      end
    end)
  end

  def assert(:==, lhs, rhs) when lhs == rhs,
    do: {:ok, "."}
  def assert(:==, lhs, rhs),
    do: {:fail, "FAIL: #{lhs} is not equal to #{rhs}"}

  def assert(:>, lhs, rhs) when lhs > rhs,
    do: {:ok, "."}
  def assert(:>, lhs, rhs),
    do: {:fail,  "FAILS: #{lhs} is not higher than #{rhs}"}
end
