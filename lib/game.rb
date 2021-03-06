class Game
  attr_reader :current_turn, :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players[1]
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    players_who_are_not(the_player).first
  end

  def game_over?
    losing_players.any?
  end 

  def loser
    losing_players.first
  end 

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end 

  def self.instance
    @game
  end 

  private
  attr_reader :players

  def losing_players
    players.select { |player| player.hit_points <= 0 }
  end

  def players_who_are_not(the_player)
    players.select { |player| player != the_player }
  end
end 