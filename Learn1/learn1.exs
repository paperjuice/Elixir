defmodule Learn do
    import IO, only: [puts: 1]
    import Kernel, except: [inspect: 1]
    import NewModule
    require Integer



    def say_here do
        inspect ("Hello World!")
    end

    def inspect(param1) do
        puts "Starting Output"
        puts param1
        puts "Ending output"
    end

    def print_sum do
        Learn.Misc.Util.Math.add(1,3)
    end

    def test do
        output_message
    end

    def is_integer(num) do
        puts "Is #{num} even? #{Integer.is_even(num)}."
    end

end
