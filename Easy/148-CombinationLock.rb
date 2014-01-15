input = gets.chomp.split(" ").map(&:to_i)

turns1 = (input[0] * 2) + input[1]

turns2 = input[0] + (input[1] - input[2] < 0 ? input[0] + input[1] - input[2] : input[1] - input[2])

turns3 = input[3] - input[2] < 0 ? input[0] + input[3] - input[2] : input[3] - input[2]

puts turns1 + turns2 + turns3