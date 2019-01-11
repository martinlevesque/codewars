defmodule CamelCase do
  def capitalize(s) do
    first_c = String.at(s, 0) |> String.upcase

    "#{first_c}#{String.slice(s, 1..-1)}"
  end

  def partial_camelize(s, split_by, do_capitalize_first) do
    String.split(s, split_by)
      |> Enum.with_index
      |> Enum.map(fn {element, index} ->
        case index do
          0 ->
            case do_capitalize_first do
              true -> capitalize(element)
              false -> element
            end
          _ -> capitalize(element)
        end
      end)
      |> Enum.reduce(fn(x, acc) -> "#{acc}#{x}" end)
  end

  def to_camel_case(str) do
    cond  do
      String.contains?(str, "-") ->
        partial_camelize(str, "-", false)
      String.contains?(str, "_") ->
        partial_camelize(str, "_", true) |> capitalize
      true -> str
    end
  end
end

#IO.puts CamelCase.to_camel_case("the-stealth-warrior") == "theStealthWarrior"
#IO.puts CamelCase.to_camel_case("The_Stealth_Warrior") == "TheStealthWarrior"
#IO.puts CamelCase.to_camel_case("A-B-C") == "ABC"

# better answer:

#defmodule CamelCase do
#  def to_camel_case(str) do
#    [ first | tail ] = String.split(str, ["-", "_"])
#    [ first | Enum.map(tail, &String.capitalize/1) ]
#    |> Enum.join
#  end
#end
