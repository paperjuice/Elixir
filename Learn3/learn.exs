defmodule Learn do
    import IO

    def testing_case (date) do
        case (date) do
            {01,12,1918} -> "Day of all days"
            {01,_,_} ->"First day fo the month"
            {25,12,year} when year > 0 -> "Christmas"
            {25, 12,_} -> "Historically talking, not christmas"
            {day, month, _} when (day >= 1)  and day <=31 and month>=1 and  (month <=12) -> "Just an avarage day"
            {_,_,_} -> "Invalide date"
        end
    end


    def readFile(path) do
        case File.read(path) do
            {:ok, data} -> IO.puts "#{data} Merge"
            {:error, error} -> IO.puts "welp, the problem was that #{error}"
        end
    end


    def recursion(-10),do: nil

    def recursion(i) do
        IO.puts "#{i} \n"
        i = i-1
        Learn.recursion(i);
    end

    def bottleOfBeers(0), do: nil
    def bottleOfBeers(i) do
        cond do
            i>20 -> puts "Mai sunt #{i} de sticle, iei una, mai ramai cu #{i-1} de sticle"
            i==20 -> puts "Mai sunt #{i} de sticle, iei una, mai ramai cu #{i-1} sticle"
            i >= 3 and i<=19 -> puts "Mai sunt #{i} sticle, iei una, mai ramai cu #{i-1} sticle"
            i == 2 -> puts "Mai sunt #{i} sticle, iei una, mai ramai cu una"
            i ==1 -> puts  "Mai e o sticle, iei una, ramai cu o laie" 
        end
        i = i-1
        Learn.bottleOfBeers(i)
    end

   def write_on_screen(dap) do
       Learn2.str(dap)
   end

end