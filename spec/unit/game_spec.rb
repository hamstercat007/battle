require 'game'

describe Game do 
  let(:charlotte) { double("Player 1") }
  let(:mittens) { double("Player 2") }
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

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq game.player_1
    end
  end

  describe '#opponent_of' do
  it 'finds the opponent of a player' do
    expect(game.opponent_of(game.player_1)).to eq game.player_2
    expect(game.opponent_of(game.player_2)).to eq game.player_1
  end
end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq game.player_2
    end
  end
end 