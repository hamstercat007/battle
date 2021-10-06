class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points 
  end

  def attack 
    player.receive_damage #why is player lower case? I haven't defined player = player = PLAYER.new 
  end 

  def receive_damage
    @hit_points -= 10
  end 
end 