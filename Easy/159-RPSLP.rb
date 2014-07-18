outcomes = {
  rock: {
    lizard: "crushes",
    scissors: "crushes"
  },
  paper: {
    rock: "covers",
    spock: "disproves"
  },
  scissors: {
    paper: "cut",
    lizard: "decapitate"
  },
  lizard: {
    spock: "poisons",
    paper: "eats"
  },
  spock: {
    scissors: "smashes",
    rock: "vaporizes"
  }
}
puts "Rock, Paper, Scissors, Lizard, Spock"
puts "Pick your weapon!"
human = gets.chomp.downcase.to_sym
computer = outcomes.keys.sample

human_str = human.to_s.capitalize
computer_str = computer.to_s.capitalize

puts "\nPlayer Picks: " + human_str
puts "Computer Picks: " + computer_str + "\n"

if human == computer
  puts "It's a tie!"
elsif outcomes[human][computer]
  puts human_str + " " + outcomes[human][computer] + " " + computer_str
  puts "Human Wins!"
else
  puts computer_str + " " + outcomes[computer][human] + " " + human_str
  puts "Computer Wins!"
end