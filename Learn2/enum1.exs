defmodule Sample do
    import TestMode

    def write_something(string) do
        if(byte_size(string) == 0) do
                IO.puts "You wrote nothing :("
            else
                IO.puts "You wrote #{string}"
        end
    end 

    def write_something, do: nil




    def what_day(day) do
        cond do
            day == :Monday ->"Luni"
            day == :Tuesday -> "Marti" 
            day == :Wednesday -> "Miercuri" 
            day == :Thursday -> "Joi" 
            day == :Friday -> "Vineri" 
            day == :Saturday -> "Sambata" 
            day == :Sunday -> "Duminica" 
            true -> "Invalide day."
        end
    end


    def what_day2(:Monday), do: "Mo"
    def what_day2(:Tuesday), do: "Tu"
    def what_day2(:Wednesday), do: "We"
    def what_day2(:Thursday), do: "Th"
    def what_day2(:Friday), do: "Fr"
    def what_day2(:Saturday), do: "Sa"
    def what_day2(:Sunday), do: "Su"
    def what_day2(_), do: "Come again pls"


    def thisWorks do
        testingThis
    end


   
   



end