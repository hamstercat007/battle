require 'game'

describe Game do 
  # let(:charlotte) { double("Player 1") }
  # let(:mittens) { double("Player 2") }
let(:game) { described_class.new(player_1, player_2) }
let(:finished_game) { described_class.new(dead_player, player_2) }
let(:player_1) { double :player, hit_points: 60 }
let(:player_2) { double :player, hit_points: 60 }
let(:dead_player) { double :player, hit_points: 0 }

  describe "#player1" do
    it "should retrieve player1" do
      expect(game.player_1).to eq(player_1)
    end
  end

  describe "#player2" do
    it "should retrieve player 2" do
      expect(game.player_2).to eq(player_2)
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

  describe '#game_over?' do
    it 'returns false if no-one is at 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game.game_over?).to be true
      end
    end

  describe '#loser' do
    it 'returns a player on less than 0HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end 