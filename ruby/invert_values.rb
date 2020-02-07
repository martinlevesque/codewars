# Given a set of numbers, return the additive inverse of each. Each positive becomes negatives, 
# and the negatives become positives.



def invert(list)
  list.map { |element| -element }
end

puts invert([1,-2,3,-4,5]).inspect