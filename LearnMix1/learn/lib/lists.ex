defmodule Lists do
    @moduledoc "List exercises"
    import IO

    #1. Write a function that returns the largest element in a list.
    def largest_elem(list) do
        largest_element = 0
        _largest_elem(list, largest_element)
    end
    defp _largest_elem([], largest_element), do: puts "The largest element in the list is #{largest_element}."
    defp _largest_elem(list, largest_element) when hd(list)> largest_element do
        largest_element = hd(list)
        _largest_elem(tl(list), largest_element)
    end
    defp _largest_elem(list, largest_element) when hd(list)<= largest_element, do: _largest_elem(tl(list), largest_element)

    #2. Write function that reverses a list, preferably in place.
    def reverse_list(list) do
        outcome_list = []
        _reverse_list(list, outcome_list) 
    end
    defp _reverse_list([], outcome_list), do: outcome_list
    defp _reverse_list(list, outcome_list)  do
        outcome_list = [hd(list)|outcome_list]
        _reverse_list(tl(list), outcome_list)
    end
   
    #3. Write a function that checks whether an element occurs in a list.
    def check_elem(list, elem), do: _check_elem(list, elem)
    defp _check_elem([], _), do: puts "Nope:( your element is not in here"
    defp _check_elem(list, elem) when hd(list)==elem, do: "Yeap, there is your element in the list."
    defp _check_elem(list, elem) when hd(list)!=elem, do: _check_elem(tl(list), elem)

    #4. Write a function that returns the elements on odd positions in a list.
    def odd_pos(list) do
        cont = 0
        outcome_list = []
        _odd_pos(list, outcome_list, cont)
    end
    defp _odd_pos([], outcome_list, _), do: outcome_list  
    defp _odd_pos(list, outcome_list, cont) when rem(cont, 2) != 0 do
        outcome_list = outcome_list ++ [hd(list)]
        cont = cont + 1 
        _odd_pos(tl(list), outcome_list, cont)
    end
    defp _odd_pos(list, outcome_list, cont) when rem(cont, 2) == 0 do
        cont = cont + 1 
        _odd_pos(tl(list), outcome_list, cont)
    end

    #5. Write a function that computes the running total of a list.
    def total_elem(list) do
        total = 0
        _total_elem(list, total)
    end
    defp _total_elem([],total), do: puts "The total of all elements in the list is: #{total}"
    defp _total_elem(list, total) do
        total = total + hd(list)
        _total_elem(tl(list), total)
    end

    #6.0. Write a function that tests whether a string is a palindrome.
    def palindrom1(string) do
        output = String.reverse(string)
        if(output == string) do
            puts "#{string} is palindrom"
        else
            puts "#{string} is not palindrom :("
        end
    end

    #6.1. Write a function that tests whether a string is a palindrome.
    def palindrom2(string), do: _palindrom2(string)
    defp _palindrom2(string) do
         cond do
            string == String.reverse(string) -> puts "#{string} is palindrom!"
            string != String.reverse(string) -> puts "#{string} is not palindrom:("
         end
    end




end