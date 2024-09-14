# frozen_string_literal: true

require 'colorize'
require 'colorized_string'
# Display
class Display
  def initialize(computer)
    @computer = computer
  end

  def title_screen
    puts 'Welcome to Mastermind.'
  end

  def self.feedback(matches, perfect_matches, user_input)
    Display.color(user_input)
    puts "\nYou got: #{matches.length} matches.\nYou got: #{perfect_matches.length} perfect matches."
  end

  def self.color(user_input)
    colors = %i[red green yellow light_blue light_magenta light_cyan gray]
    user_input.each { |word| print word.colorize(color: :black, background: colors[word.to_i - 1]) }
  end

  def self.final_feedback(victory)
    puts 'You win!' if victory == true

    puts 'Your out of tries.\nYou lose.' if victory == false
  end
end
