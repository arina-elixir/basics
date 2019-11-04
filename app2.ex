defmodule App2 do
  def greet_everybody() do
    total = IO.gets("How many students do you have? ")

    try do
      total = String.to_integer(total |> String.replace("\n", ""))
      IO.puts(message(total))
    rescue
      e in ArgumentError ->
        IO.puts("An error occurred. " <> e.message)
        IO.puts("\nPlease try again with a number ")
        greet_everybody()
    end
  end

  def message(total) when is_integer(total) when is_float(total) do
    cond do
      total < 0 ->
        "You can not be owing students na."

      total == 1 ->
        "Hello, you only have #{total} student! Keep trying."

      total > 1 ->
        "Hello, you have #{total} students! You're trying o."
    end
  end
end
