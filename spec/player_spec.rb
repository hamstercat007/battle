require 'player'

describe Player do 
  subject(:charlotte) { Player.new('Charlotte') }

  describe "#name" do 
    it "returns the name" do 
      expect(subject.name).to eq 'Charlotte'
  end
end 