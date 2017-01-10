defmodule Learn2 do
    @moduledoc "Description test"
    IO.inspect (@moduledoc)
    import IO


    def exercise1 do
        IO.puts "Hello World!"
    end

    def exercise2 do
        name = gets "What is your name?\n"
        puts "Nice to meet you, #{String.trim(name)}!"
    end

    def exercise3 do
        name = to_string(gets "What is your name?\n")
        name
        |>String.trim("\n")
        |>String.downcase
        |>check_for_name
    end
    def check_for_name(name) when name == "bob" or name == "alice" or name == "bj", do: puts "I knew it was you :)"
    def check_for_name(_), do: puts "You\'r dead in my eyes >:("

    def sum (number) do
        total = Enum.sum(1..number)
        puts "#{total} cartofi"
    end

    #only when div with 3 or 5
    def sum2(0), do: nil
    def sum2 (number) do
        total = number + (number - 1)
        number = number-1
        if(number == 0) do
            puts "#{total}"
        end
        sum2(number)
    end
    def add_numbers(total) do
        
    end







end