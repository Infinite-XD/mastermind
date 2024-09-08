require_relative "lib/computer"
require_relative "lib/display"
require_relative "lib/game"
require_relative "lib/player"

computer = Computer.new
display = Display.new(computer)
player = Player.new("cheese")
game = Game.new(computer, player, display)

p computer.code
game.start
