defmodule Log do
  @moduledoc false


  def add_logger,
    do: Application.put_env(:metaprogramming, :log_level, :debug)

  defmacro log(expression) do
    if Application.get_env(:metaprogramming, :log_level) == :debug do
      quote bind_quoted: [expression: expression] do
        IO.puts "============"
        IO.inspect expression
        IO.puts "============"
        expression
      end
    else
      expression
    end
  end
end
