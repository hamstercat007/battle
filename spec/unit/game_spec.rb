require 'game'

describe Game do 
  # subject(:charlotte) { Player.new('Charlotte') }
  # subject(:mittens) { Player.new('Mittens') }
  let(:charlotte) { double("Player 1") }

  describe '#attack' do
    it 'damages the player' do
      expect(charlotte).to receive(:receive_damage)
      subject.attack(charlotte)
    end
  end
end 