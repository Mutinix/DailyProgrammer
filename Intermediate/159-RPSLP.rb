def main_game
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

  opponent_moves = {
    rock: 0,
    paper: 0,
    scissors: 0,
    lizard: 0,
    spock: 0
  }

  puts "Rock, Paper, Scissors, Lizard, Spock"

  while true
    puts "\n=========="
    puts "1. Play"
    puts "2. Exit"
    choice = gets.chomp.to_i
    if choice == 2
      puts "==========\n"
      break
    end
  
    games_played += 1
    puts "Pick your weapon!"
    human = gets.chomp.downcase.to_sym
    computer = intermediate_ai(outcomes, opponent_moves)
  
    opponent_moves[human] += 1

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

  puts "\n=== Statistics ==="
  puts "Games Played: #{games_played}"
  puts "Human Wins: #{human_wins}"
  puts "Computer Wins: #{computer_wins}"
  puts "Ties: #{ties}"
  puts "=================="
end

def intermediate_ai(outcomes, opponent_moves)
  opponent_most_used = []
  opponent_moves.each { |k, v| opponent_most_used.push(k) if v == opponent_moves.values.max }
  
  possible_moves = []
  outcomes.each do |k, v|
    opponent_most_used.each { |move| possible_moves.push(k) if v[move] } # Find counters for opponent's most used moves
  end
  
  possible_moves.uniq!
  possible_moves = possible_moves - opponent_most_used # To avoid ties
  computer_move = possible_moves.empty? ? outcomes.keys.sample : possible_moves.sample # Return a random move if no data to work with
  
  return computer_move
end

main_game()