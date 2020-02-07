# 550498447451fbbd7600041c

# Given two arrays a and b write a function comp(a, b) (compSame(a, b) in Clojure) that
# checks whether the two arrays have the "same" elements, with the same multiplicities.
# "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

# a = [121, 144, 19, 161, 19, 144, 19, 11]
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

defmodule Aretheythesame do



	@spec comp([number], [number]) :: boolean
  def comp(a, b) do
    # your code
    i_taken = []
    Enum.all?(a, fn x ->
      #IO.puts "a = #{a}, itaken #{inspect i_taken}"
      i_taken = i_taken ++ [2]
      IO.puts "i taken = #{inspect i_taken}"


      Enum.with_index(b)
      |> Enum.any?(fn {b_elem, index} ->
        IO.puts "x = #{x} cur element #{b_elem}"

        res_with_index = case x * x == b_elem do
          true -> {true, index}
          false -> {false, nil}
        end

        {res, _} = res_with_index

        res
      end)
    end) &&
    Enum.all?(b, fn x ->
      Enum.any?(a, fn a_elem -> a_elem * a_elem == x end)
    end)
  end

end

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
IO.puts "same ? #{Aretheythesame.comp(a, b)}"

IO.inspect Aretheythesame.comp([121, 144, 19, 161, 19, 144, 19, 11],
      [11*21, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])

IO.inspect Aretheythesame.comp([121, 144, 19, 161, 19, 144, 19, 11],
  [11 * 11, 121 * 121, 144 * 144, 190 * 190, 161 * 161, 19 * 19, 144 * 144, 19 * 19])

IO.inspect Aretheythesame.comp([2, 2, 3], [4, 9, 9]) # should be false
