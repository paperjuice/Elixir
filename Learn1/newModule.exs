defmodule NewModule do
    import IO, only: [puts: 1]

    def output_message do
        puts("Merge!, Dap")
    end
end