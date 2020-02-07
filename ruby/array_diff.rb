# Your goal in this kata is to implement a difference function, which subtracts one list 
# from another and returns the result.

def array_diff(a, b)
  a.select { |a_element| !b.include?(a_element) }
end

puts array_diff([1,2,2,4,5], [2]).inspect