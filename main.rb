require_relative 'game'
require_relative 'player'
require_relative 'deck'
require_relative 'bank'
require_relative 'interface'

interface = Interface.new
dealer = Dealer.new
user = User.new
game = Game.new(interface, dealer, user)
game.run
