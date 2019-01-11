"""
You need to create a function that will validate if given parameters are valid geographical coordinates.

Valid coordinates look like the following: "23.32353342, -32.543534534". The return value should be either true or false.

Latitude (which is first float) can be between 0 and 90, positive or negative. Longitude (which is second float) can be between 0 and 180, positive or negative.

Coordinates can only contain digits, or one of the following symbols (including space after comma) -, .

There should be no space between the minus "-" sign and the digit after it.

Here are some valid coordinates:

-23, 25
24.53525235, 23.45235
04, -23.234235
43.91343345, 143
4, -3
And some invalid ones:

23.234, - 23.4234
2342.43536, 34.324236
N23.43345, E32.6457
99.234, 12.324
6.325624, 43.34345.345
0, 1,2
0.342q0832, 1.2324
"""

defmodule Solution do
  def coord_valid?(coord, min, max) do
    coord >= min && coord <= max
  end

  def parse_my_nb(s) do
    case Float.parse(s) do
      :error -> nil
      {parsed_nb, ""} -> parsed_nb
      _ -> nil
    end
  end

  def parse_potential_nb(s) do
    case Regex.match?(~r/^[-]?([0-9]*[.])?[0-9]+$/, s) do
      true -> parse_my_nb(s)
      false -> nil
    end
  end

  def isValidCoordinates(coords) do
    coord_parts = coords
      |> String.split(",")
      |> Enum.map(fn p -> p |> String.trim |> parse_potential_nb end)

    length(coord_parts) == 2 &&
    coord_valid?(Enum.at(coord_parts, 0), -90, 90) &&
    coord_valid?(Enum.at(coord_parts, 1), -180, 180)
  end
end


IO.inspect Solution.isValidCoordinates("23.245, 1e1")
