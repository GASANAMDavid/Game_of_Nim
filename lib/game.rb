class Game
  attr_reader :stick_piles

  def initialize(stick_piles)
    @stick_piles = stick_piles
  end

  def sticks_to_remove
    puts 'Enter number of sticks to remove'
    sticks = gets.chomp.to_i
    puts 'Enter the pile index'
    pile_index = gets.chomp.to_i
    [sticks, pile_index]
  end

  def validate_move(move)
    # puts move
    num_of_sticks = @stick_piles[move[1]]
    num_of_sticks >= move[0] && move[0].positive?
  end

  def actual_move(move)
    @stick_piles[move[1]] = @stick_piles[move[1]] - move[0]
    puts @stick_piles
    @stick_piles.delete(0)
  end

  def play
    player = 'David'
    k = 1

    while @stick_piles != [1]
      puts "#{player}'s turn"
      move = sticks_to_remove
      next unless validate_move(move)

      puts k
      k += 1
      actual_move(move)
      player = if player == 'David'
                 'Manzi'
               else
                 'David'
               end
    end

    "#{player} has won the game!"
  end
end
