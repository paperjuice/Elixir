defmodule Learn1 do
   # import IO
    def read(path) do
        #asd = Enum.count(givenChars(IO.gets("writeTheLetters\n")))

        File.read!(path)
        |>String.split("\r\n")
        |>Enum.filter(&numberOfLetters(&1, 6))
        |>list

    end

    def list(list) do
        outputList(list)
    end

    def outputList([]), do: nil
    def outputList(list) do
        IO.puts("#{hd(list)}")
        newList = tl(list)
        outputList(newList)
    end

    def clear do
        IO.write [IO.ANSI.home, IO.ANSI.clear];IEx.dont_display_result
    end
    
    def numberOfLetters(word, numberOfLetters) do
        if(String.length(word)>numberOfLetters) do
            IO.puts("this word is hugeeee")
        end
    end

    def givenChars(letters) do
        letterList = 'letters'
    end
end