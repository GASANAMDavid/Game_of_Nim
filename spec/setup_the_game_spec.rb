require_relative '../lib/set_up_the_game'

RSpec.describe SetUpTheGame do
  context 'set up piles' do
    before do
      allow(subject).to receive(:gets).and_return('4')
    end
    it 'should prompt users for number of piles' do
      expect { subject.setup_piles }.to output("Please enter the number of piles for the game:\n").to_stdout
    end

    it 'should expect integer input of piles' do
      expect(subject.setup_piles).to eq(4)
    end
  end

  context 'set up number of sticks' do
    before do
      allow(subject).to receive(:gets).and_return('7', '5', '3', '1')
    end
    it 'should prompt user for a number of sticks in each pile' do
      expect(subject.add_sticks_to_piles(4)).to eq([7, 5, 3, 1])
    end
  end

  # it 'should prompt users for type of game '
end
