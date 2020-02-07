#The Western Suburbs Croquet Club has two categories of membership, Senior and Open. 
#They would like your help with an application form that will tell prospective members 
#which category they will be placed.

#To be a senior, a member must be at least 55 years old and have a handicap greater than 7. 
#In this croquet club, handicaps range from -2 to +26; the better the player the lower the 
#handicap.

#Input
#Input will consist of a list of lists containing two items each. Each list contains information 
#for a single potential member. Information consists of an integer for the person's age and 
#  an integer for the person's handicap.

def open_or_senior(data)
  data.map do |member|
    if member[0] >= 55 && member[1] > 7
      'Senior'
    else
      'Open'
    end
  end
end

puts open_or_senior([[45, 12],[55,21],[19, -2],[104, 20]]).inspect