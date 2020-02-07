
def count_bits(n)
  n.to_s(2).chars.count('1')
end

puts count_bits(1234).inspect
