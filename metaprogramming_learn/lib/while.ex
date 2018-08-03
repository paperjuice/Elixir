defmodule WhileRecreated do
  @moduledoc """
  Following Metaprogramming Elixir by Chris McCord, page: 23
  """

  defmacro whilee(expression, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          if unquote(expression) do
            unquote(block)
          else
            WhileRecreated.break
          end
        end
      catch
        :break -> :ok
      end
    end
  end
  def break, do: throw :break

  def run_loop do
    self_p = self()
    spawn(fn ->
      IO.inspect("started")
      :timer.sleep(5000)
      send(self_p, WhileRecreated.break())
    end)

    whilee true do
      IO.puts "#{ inspect :erlang.time } Staying alive!"
      :timer.sleep(1000)
    end
  end

  def spawn_p do
    spawn(fn ->
      whilee true do
        receive do
          :break -> IO.inspect break()
          message -> IO.puts "Received #{message}"
        end
      end
    end)
  end

  def send_msg(pid, message) do
    send(pid, message)
  end
end
