defmodule RemoveDuplicates do

  # ----------------
  # SOLUTION 1
  # ---------------
  # :timer.tc -> {11598183, "helo\nrtyujnmzbaq"} on a 62M binary
  def rm1() do
    {:ok, string} = File.read("test.txt")

    string
    |> String.to_charlist()
    |> Enum.uniq()
    |> List.to_string()
  end


  # ----------------
  # SOLUTION 2
  # ---------------
  # :timer.tc -> {35585422, "helo\nrtyujnmzbaq"} on a 62M binary
  def rm2() do
    {:ok, string} = File.read("test.txt")
    list = String.to_charlist(string)
    do_rm2(list, [], [])
  end
  defp do_rm2([], filtered, _acc), do: filtered |> List.to_string()
  defp do_rm2(string, filtered, acc) do
    head = hd(string)

    if has?(acc, head),
    do: do_rm2(tl(string), filtered, acc),
    else: do_rm2(tl(string), filtered ++ [head], [head| acc])
  end

  defp has?(list, char) do
    try do
      for item <- list do
        if item == char, do: throw true
      end

    false
    catch
      msg -> msg
    end
  end
end
