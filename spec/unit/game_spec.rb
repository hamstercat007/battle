require 'game'

describe Game do 
  let(:charlotte) { double("Player 1") }
  let(:mittens) { double("Player 1") }
  let(:game) { described_class.new(charlotte, mittens)}

  describe '#attack' do
    it 'damages the player' do
      expect(charlotte).to receive(:receive_damage)
      game.attack(charlotte)
    end
  end

  describe "#player1" do
    it "should retrieve player1" do
      expect(game.player_1).to eq(charlotte)
    end
  end

  describe "#player2" do
    it "should retrieve player 2" do
      expect(game.player_2).to eq(mittens)
    end
  end
end 