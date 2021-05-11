require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new([1, 3, 5, 7]) }
  it 'initialise the game with piles and sticks' do
    expect(game.stick_piles).to eq([1, 3, 5, 7])
  end

  it 'should prompt user to remove Sticks from a specific pile' do
    allow(game).to receive(:gets).and_return('3', '1')
    expect(game.sticks_to_remove).to eq([3, 1])
  end

  it 'should validate the move' do
    expect(game.validate_move([3, 1])).to eq(true)
  end

  it 'remove sticks from a pile' do
    expect { game.actual_move([3, 3]) }.to change(game.stick_piles, :last).to eq(4)
    expect { game.actual_move([3, 1]) }.to change(game.stick_piles, :count).by(-1)
  end

  it 'expect the first player to win the game' do
    allow(game).to receive(:gets).and_return('3', '3', '2', '2', '2', '1', '2', '2', '3', '3', '1', '1', '1', '2', '1',
                                             '1')
    expect(game.play).to eq('David has won the game!')
  end
end
