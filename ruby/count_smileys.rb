# Rules for a smiling face:
# -Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
# -A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
# -Every smiling face must have a smiling mouth that should be marked with either ) or D.
# No additional characters are allowed except for those mentioned.


def count_smileys(arr)
  arr.count { |element| element =~ /^[;:][-~]?[\)D]$/ }
end

puts count_smileys([';D', ':-(', ':-)', ';~)']).inspect