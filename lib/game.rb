# Game Class which controls entire game
class Game
  def initialize(computer, player, display)
    @computer = computer
    @player = player
    @display = display
  end

  def feed_back(response)
    player_code = response.chars
  end

  def check_matches(response, perfect_matches)
    code = @computer.code
    player_code = response.chars
    matches = []
    code.each_with_index do |char, index|
      player_code.each_with_index do |inner_char, inner_index|
        if char == inner_char && perfect_matches.find_index(inner_index).nil? && matches.find_index(inner_index).nil?
          matches.push(inner_index)
        end
      end
    end
    puts "Matches : #{matches}"
  end

  def check_perfect_matches(response)
    player_code = response.chars
    code = @computer.code
    perfect_matches = []
    4.times do |num|
      next unless code[num] == player_code[num]

      perfect_matches.push(num)
    end
    puts "Perfect Matches : #{perfect_matches}"
    perfect_matches
  end

  def start
    puts "Do you want to be a code BREAKER or MAKER? \nEnter '1' to be a MAKER\nEnter '2' to be a BREAKER"
    user_input = gets.chomp until %w[1 2].include?(user_input)
    if user_input == "1"
      code_breaker
    else
      code_maker
    end
  end

  def code_breaker
    10.times do |number|
      puts "Turn ##{number + 1}: Type in four numbers (1-6) to guess code, or 'q' to quit game."
      player_guess = gets.chomp
      check_matches(player_guess, check_perfect_matches(player_guess))
    end
  end

  def code_maker
  end
end
