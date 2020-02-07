# Check to see if a string has the same amount of 'x's and 'o's. 
# The method must return a boolean and be case insensitive. The string can contain any char.

def XO(str)
  str.count('x') + str.count('X') == str.count('o') + str.count('O')
end

puts XO('Xxx-Ooo')