# Game Class which controls entire game
class Game
  def initialize(computer, player, display)
    @computer = computer
    @player = player
    @display = display
  end

  def feed_back(response)
    code = @computer.code
    player_code = response.chars
    matches = 0
    perfect_matches = 0
    code.each_with_index do |char, index|
      player_code.each_with_index do |inner_char, inner_index|
        matches += 1 if inner_char == char && index != inner_index
        perfect_matches += 1 if inner_char == char && index == inner_index
      end
    end
  end

  def start
    puts "Do you want to be a code BREAKER or MAKER? \nEnter '1' to be a MAKER\nEnter '2' to be a BREAKER"
    user_input = gets.chomp until user_input != "1" || user_input != "2"
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
      feed_back(player_guess)
    end
  end

  def code_maker
  end
end
