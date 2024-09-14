require_relative('game')

# Computer class, generates codes, breaks codes.
class Computer
  attr_accessor :code, :candidate_codes

  CODES = %w[1 2 3 4 5 6].freeze
  def initialize(code = Array.new(4) { CODES.sample })
    @code = code
    @candidate_codes = Array(1111..6666)
  end

  def break_code(new_code)
    @code = new_code
    win = false
    10.times do |number|
      break if win == true

      puts "Turn ##{number + 1}"
      info = Game.check_matches(code_gen(number), Game.check_perfect_matches(code_gen(number), @code), @code)
      eliminate(info)
    end
  end

  def code_gen(num)
    return '1122' if num.zero?

    @candidate_codes[0]
  end

  def eliminate(feedback)
    @candidate_codes.each_with_index do |code, index|
      @candidate_codes.delete_at(index) if Game.check_matches(code.to_s,
                                                              Game.check_perfect_matches(code.to_s, @code), @code) != feedback[1]
    end
  end
end
