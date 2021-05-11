require_relative 'game'
require_relative 'set_up_the_game'

piles = SetUpTheGame.setup_piles
game = Game.new(SetUpTheGame.add_sticks_to_piles(piles))
game.play
