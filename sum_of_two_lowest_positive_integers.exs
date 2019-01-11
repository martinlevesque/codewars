"""
Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 integers. No floats or empty arrays will be passed.

For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.

[10, 343445353, 3453445, 3453545353453] should return 3453455.
"""

defmodule SmallSummer do
  def sum_two_smallest_numbers(numbers) do
    numbers
    |> Enum.filter(fn x -> x > 0 end)
    |> Enum.sort
    |> Enum.take(2)
    |> Enum.sum
  end
end

IO.inspect SmallSummer.sum_two_smallest_numbers([33, -9, 5, 8, 12, 19, 22]) # 13
