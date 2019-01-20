defmodule LoadingBar do
  @moduledoc false

  @total 50

  @complete_shape_1 "█"
  @left_shape_1 "▒"

  def temp do
    do_temp(0)
  end

  defp do_temp(100), do: IO.write("\r#{build_loading_bar(100)}  - Complete!")

  defp do_temp(num) do
    IO.write("\r#{build_loading_bar(num)} -  #{num}.0")

    Process.sleep(50)

    do_temp(num+1)
  end

  defp build_loading_bar(percentage) do
    count = Kernel.trunc(percentage/2)
    add_chars(count, @total-count)
  end

  defp add_chars(complete, rest) do
    String.duplicate(@complete_shape_1, complete) <>
      String.duplicate(@left_shape_1, rest)
  end
end

