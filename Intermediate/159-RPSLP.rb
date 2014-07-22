games_played = 0
human_wins = 0
computer_wins = 0
ties = 0

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

while true
  puts "\n=========="
  puts "1. Play"
  puts "2. Exit"
  choice = gets.chomp.to_i
  break if choice == 2
  
  games_played += 1
  puts "Pick your weapon!"
  human = gets.chomp.downcase.to_sym
  computer = outcomes.keys.sample

  human_str = human.to_s.capitalize
  computer_str = computer.to_s.capitalize

  puts "\nPlayer Picks: #{human_str}"
  puts "Computer Picks: #{computer_str}\n"

  if human == computer
    puts "It's a tie!"
    ties += 1
  elsif outcomes[human][computer]
    puts "#{human_str} #{outcomes[human][computer]} #{computer_str}"
    puts "Human Wins!"
    human_wins += 1
  else
    puts "#{computer_str} #{outcomes[computer][human]} #{human_str}"
    puts "Computer Wins!"
    computer_wins += 1
  end
  puts "=========="
end

puts "\n== Statistics =="
puts "Games Played: #{games_played}"
puts "Human Wins: #{human_wins}"
puts "Computer Wins: #{computer_wins}"
puts "Ties: #{ties}"