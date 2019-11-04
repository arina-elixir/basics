defmodule App2 do
  def greet_everybody() do
    total = IO.gets("How many students do you have? ")
    total = String.to_integer(total |> String.replace("\n", ""))
    IO.puts(message(total))
  end

  def message(total) do
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
