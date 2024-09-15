# Game Class which controls entire game
class Game
  def initialize(computer, player, display)
    @computer = computer
    @player = player
    @display = display
  end

  def check_matches(response, perfect_matches)
    code = @computer.code
    player_code = response.chars
    matches = [[], []]
    matches_temp = []
    code.each_with_index do |char, index|
      player_code.each_with_index do |inner_char, inner_index|
        unless char == inner_char && perfect_matches.find_index(inner_index).nil? && perfect_matches.find_index(index).nil? && matches[0].find_index(inner_index).nil? && matches[1].find_index(index).nil?
          next
        end

        matches[0].push(inner_index)
        matches[1].push(index)
        matches_temp.push(index)
        break
      end
    end
    @display.feedback(matches_temp, perfect_matches, player_code) if player_code != code
    true if player_code == code
  end

  def check_perfect_matches(response)
    player_code = response.chars
    code = @computer.code
    perfect_matches = []
    4.times do |num|
      next unless code[num] == player_code[num]

      perfect_matches.push(num)
    end
    perfect_matches
  end

  def start
    puts "Do you want to be a code BREAKER or MAKER? \nEnter '1' to be a BREAKER\nEnter '2' to be a MAKER"
    user_input = gets.chomp until %w[1 2].include?(user_input)
    if user_input == '1'
      code_breaker
    else
      code_maker
    end
  end

  def code_breaker
    win = false
    10.times do |number|
      break if win == true

      puts "Turn ##{number + 1}: Type in four numbers (1-6) to guess code, or 'q' to quit game."
      player_guess = gets.chomp
      win = check_matches(player_guess, check_perfect_matches(player_guess))
    end
    @display.final_feedback(win)
  end

  def code_maker
    puts "Enter your code.\n"
    player_code = gets.chomp
    win = @computer.break_code(player_code)
    puts 'You lose!' if win[0] == true
  end

  def self.check_comp_matches(comp_code, player_code, perfect_matches)
    code = comp_code.to_s.chars
    player_code = player_code.to_s.chars
    matches = [[], []]
    matches_temp = []
    code.each_with_index do |char, index|
      player_code.each_with_index do |inner_char, inner_index|
        unless char == inner_char && perfect_matches.find_index(inner_index).nil? && perfect_matches.find_index(index).nil? && matches[0].find_index(inner_index).nil? && matches[1].find_index(index).nil?
          next
        end

        matches[0].push(inner_index)
        matches[1].push(index)
        matches_temp.push(index)
        break
      end
    end
    [matches_temp.length, perfect_matches.length]
  end

  def self.check_comp_perfect_matches(comp_code, response)
    player_code = response.to_s.chars
    code = comp_code.to_s.chars
    perfect_matches = []
    4.times do |num|
      next unless code[num] == player_code[num]

      perfect_matches.push(num)
    end
    perfect_matches
  end
end
