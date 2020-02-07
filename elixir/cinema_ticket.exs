"""
My friend John likes to go to the cinema. He can choose between system A and system B.

System A : buy a ticket (15 dollars) every time
System B : buy a card (500 dollars) and every time
    buy a ticket the price of which is 0.90 times the price he paid for the previous one.
#Example: If John goes to the cinema 3 times:

System A : 15 * 3 = 45
System B : 500 + 15 * 0.90 + (15 * 0.90) * 0.90 + (15 * 0.90 * 0.90) * 0.90 ( = 536.5849999999999, no rounding for each ticket)
John wants to know how many times he must go to the cinema so that the final result of System B, when rounded up to the next dollar, will be cheaper than System A.

The function movie has 3 parameters: card (price of the card), ticket (normal price of a ticket), perc (fraction of what he paid for the previous ticket) and returns the first n such that

ceil(price of System B) < price of System A.
More examples:

movie(500, 15, 0.9) should return 43
    (with card the total price is 634, with tickets 645)
movie(100, 10, 0.95) should return 24
    (with card the total price is 235, with tickets 240)
"""

defmodule Movie do

  def price_sys_a(ticket, nb) do
    ticket * nb
  end

  def price_sys_b(card, ticket, perc, nb = 0, my_history) do
    card * 1.0
  end

  def price_sys_b(card, ticket, perc, nb, my_history) do

    already_computed = :ets.lookup(my_history, "p-for-#{nb}")

    cond do
      already_computed == [] ->
        p_before = price_sys_b(card, ticket, perc, nb-1, my_history)
        p_cur = ticket * :math.pow(perc, nb)
        p = p_before + p_cur

        :ets.insert(my_history, {"p-for-#{nb}", p})

        p
      [{_, computed_value} | _ ] = already_computed -> computed_value
    end

  end

  def find_first_n(card, ticket, perc, nb, my_history) do

    case (price_sys_b(card, ticket, perc, nb, my_history) |> Float.ceil) < price_sys_a(ticket, nb) do
      true -> nb
      false -> find_first_n(card, ticket, perc, nb + 1, my_history)
    end
  end

  def movie(card, ticket, perc) do
    my_history = :ets.new(:my_history, [:set, :protected])
    find_first_n(card, ticket, perc, 0, my_history)
  end
end

IO.inspect Movie.movie(50000, 800, 1.0)

#IO.puts "movie #{inspect Movie.movie(100.0, 10.0, 0.95)}"
