require_relative 'game'
# Computer class, generates codes, breaks codes.
class Computer
  attr_accessor :code

  CODES = %w[1 2 3 4 5 6].freeze
  def initialize(code = Array.new(4) { CODES.sample })
    @code = code
    @user_code = nil
    @candidate_codes = candidate_codes_gen
  end

  def candidate_codes_gen
    candidate_codes = Array(1111..6666)
    wanted = []
    temp = true
    candidate_codes.each do |code|
      code.to_s.chars.each { |char| temp = false if char.to_i > 6 || char.to_i < 1 }
      wanted.append(code) if temp == true
      temp = true
    end
    wanted
  end

  def break_code(user_code)
    @user_code = user_code
    comp_guess = 1122
    10.times do |num|
      puts "Turn #{num + 1}:\nThe computer guesses: #{comp_guess}"
      eliminate(Game.check_comp_matches(comp_guess, @user_code,
                                        Game.check_comp_perfect_matches(comp_guess, @user_code)), comp_guess)
      comp_guess = @candidate_codes[0]
      return [true, comp_guess] if @user_code == comp_guess.to_s
    end
  end

  def eliminate(feedback, comp_guess)
    temp_codes = []
    @candidate_codes.each do |char|
      temp_feedback = Game.check_comp_matches(comp_guess, char,
                                              Game.check_comp_perfect_matches(comp_guess, char))
      temp_codes.append(char) if feedback == temp_feedback
    end
    @candidate_codes = temp_codes
  end
end
