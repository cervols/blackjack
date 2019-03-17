require_relative 'game'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'bank'
require_relative 'interface'

interface = Interface.new
game = Game.new(interface)
game.run
