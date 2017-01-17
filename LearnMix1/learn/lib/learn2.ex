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

    #5. try to turn a IO.gets into an is_integer
    def x do
        b = IO.gets("Enter an integer: \n") 
        |> String.trim("\n")
        |> String.to_integer()
        puts "#{b + 1}"
    end

    #6. sum only when div with 3 or 5 in a list
    def sum(list,total) do 
        _sum(list,total)
    end
    defp _sum([], total) do 
        puts "The total is: #{total}."
    end
    defp _sum(list, total) when rem(hd(list),3) == 0 or rem(hd(list),5)==0 do 
             _sum(tl(list), total + hd(list))
    end
    defp _sum(list, total) do 
        _sum(tl(list),total)
    end

    #7. sum from 1 to n, where n is divizible with 3 or 5
    def sum2(number, total) do
        _sum2(number, total)
    end
    defp _sum2(0, total) do
        puts "The sum of all numbers is #{total}"
    end
    defp _sum2(number, total) when rem(number,3)==0 or rem(number,5)==0 do
        _sum2(number-1, total + number)
    end
    defp _sum2(number, total) do
        _sum2(number-1, total)
    end
    

    #8. Write a program that prints a multiplication table for numbers up to 12.
    def multiply_table do
        a = 1
        b = 1
        _multiply_table(a, b)
    end
    defp _multiply_table(a, b) when a ==12 and b == 13 do
        nil
    end 
    defp _multiply_table(a, b) when b ==13 do
        b = 1
        a = a+1
        _multiply_table(a,b)
    end
    defp _multiply_table(a, b) when b <=12 do
        puts "#{a} x #{b} = #{a*b}"
        b = b+1
        _multiply_table(a,b)
    end  


    #9. Write a program that prints all prime numbers until 99.
    def primes do
        number_divided_by = 1
        divisor = 1
        _primes(divisor, number_divided_by)
    end
    defp _primes(_, 99) do
        nil
    end 
    defp _primes(divisor, number_divided_by) when divisor == 1 do
        _primes(divisor + 1, number_divided_by)        
    end
    defp _primes(divisor, number_divided_by) when divisor < number_divided_by and rem(number_divided_by, divisor) !=0 do
        _primes(divisor+1, number_divided_by)
    end
    defp _primes(divisor, number_divided_by) when divisor < number_divided_by and rem(number_divided_by, divisor) ==0 do
        _primes(1, number_divided_by+1)
    end
    defp _primes(divisor, number_divided_by) when divisor >= number_divided_by do
        puts "#{number_divided_by} is prime"
        _primes(1, number_divided_by+1)
    end

    #10. Write a guessing game where the user has to guess a secret number. 
    #After every guess the program tells the user 
    #whether their number was too large or too small. 
    #At the end the number of tries needed should be printed. 
    #I counts only as one try if they input the same number multiple times consecutively.
    def guessing_game do
        random_number = Enum.random(1..10)
        number_of_guessings = 0
        number = input_number("Guess a number between 1 and 10 included.\n")
        _guessing_game(random_number, number_of_guessings, number)
    end
    defp _guessing_game(random_number, number_of_guessing, guessed_number) when random_number > guessed_number do
        number_of_guessing = number_of_guessing + 1
        number = input_number("The number is higher than your guess. Try another number! \n")
        #list ++ [number]
        _guessing_game(random_number, number_of_guessing, number)
    end
    defp _guessing_game(random_number, number_of_guessing, guessed_number) when random_number < guessed_number do
        number_of_guessing = number_of_guessing + 1
        number = input_number("The number is lower than your guess. Try another number! \n")
        #list ++ [number]
        _guessing_game(random_number, number_of_guessing, number)
    end
    defp _guessing_game(random_number, number_of_guessing, guessed_number) when random_number == guessed_number and number_of_guessing == 0 do
        puts "Amazing! You guessed the number in the first try!"
    end
    defp _guessing_game(random_number, number_of_guessing, guessed_number) when random_number == guessed_number and number_of_guessing>=1 do
        puts "Great job! You guessed the number in #{number_of_guessing} tries!"
    end

    defp input_number(string) do
        gets(string)
        |>String.trim("\n")
        |>String.to_integer
    end

   # defp _check_duplicates([_], tries), do: tries = tries + 1  
    #defp _check_duplicates(list, tries) do
    #    head = hd(list)
     #   tail = tl(list)
      #  if(head != hd(tail)) do
       #     tries = tries + 1
       # end
       # _check_duplicates(tl(list), tries)
    #end    

    







    #Write a program that prints the next 20 leap years.
    def leap_years do
        cont = 20
        year = 2017
        _leap_years(cont, year)
    end
    defp _leap_years(0, _), do: puts("These are the next 20 leap years.")
    defp _leap_years(cont, year) when rem(year,4) != 0 do
        year = year + 1
        _leap_years(cont, year)
    end
    defp _leap_years(cont, year) when rem(year,4) == 0 do
        puts("#{year} is a leap year")
        year = year + 1
        cont = cont - 1
        _leap_years(cont, year)
    end
    














end