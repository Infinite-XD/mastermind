# Computer class, generates codes, breaks codes.
class Computer
  attr_accessor :code

  CODES = %w[1 2 3 4 5 6].freeze
  def initialize(code = Array.new(4) { CODES.sample })
    @code = code
  end

  def break_code
    candidate_codes = Array(1111..6666)
    p candidate_codes
  end
end
