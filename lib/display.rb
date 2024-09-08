require "colorize"
# Display
class Display
  def initialize(computer)
    @computer = computer
  end

  def title_screen
    puts "Welcome to Mastermind."
  end

  def feedback(matches, perfect_matches)
    puts "You got: #{matches} matches.\nYou got: #{perfect_matches} perfect matches."
  end
end
