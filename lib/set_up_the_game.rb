# Module Interface
module SetUpTheGame
  def self.setup_piles
    puts 'Please enter the number of piles for the game:'
    gets.chomp.to_i
  end

  def self.add_sticks_to_piles(num_of_piles)
    game_board = []
    (0..num_of_piles - 1).each do |_i|
      game_board << gets.chomp.to_i
    end
    game_board
  end
end
