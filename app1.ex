defmodule App1 do
  def greet_everybody() do
    total = IO.gets("How many students do you have?")
    IO.puts("Hello, you have #{total}! You're trying o")
  end
end
