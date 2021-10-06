require 'player'

describe Player do 
  subject(:charlotte) { Player.new('Charlotte') } #key? 
  subject(:mittens) { Player.new('Mittens') } 

  describe "#name" do 
    it "returns the name" do 
      expect(charlotte.name).to eq 'Charlotte'
    end
  end 

  describe "#hit points" do
    it "returns the hit points" do 
      expect(charlotte.hit_points). to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe "#attack" do
    it 'damages the player' do 
      expect(mittens).to receive(:receive_damage) #why is charlotte attack mittens before this? 
      charlotte.attack(mittens)
    end 
  end
  
  describe "#receive_damage" do
    it 'reduces the player hit points' do 
      expect {charlotte.receive_damage }.to change { charlotte.hit_points }.by(-10) #why is this in curly braces? 
    end
  end
end 