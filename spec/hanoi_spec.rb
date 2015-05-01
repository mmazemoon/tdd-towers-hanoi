require "rspec"
require "hanoi"

describe Hanoi do
  let(:game) {Hanoi.new(3)}

  describe "#game_won?" do
    it "returns false for a new game" do
      expect(game.game_won?).to be false
    end

    it "returns true if the last peg is finished" do
      game.towers[0] = []
      game.towers[2] = game.victory_state

      expect(game.game_won?).to be true
    end
  end

  describe '#render' do
    it "outputs the towers to the screen" do
      expect(game.render).to eq(game.towers)
    end

  end

  describe '#move_disc' do
    before(:each) { game.move_disc(0, 2) }

    it "places a disc on the second tower" do
      expect(game.towers[2]).to_be eq([1])
    end

    it "removes a disc from the first tower" do
      expect(game.towers[0]).to_be eq([3,2])
    end

    # it "doesn't move a disc " do
    #   expect(game.towers[0]).to_be eq([3,2])
    # end
    #
    # it "removes a disc from the first tower" do
    #   expect(game.towers[0]).to_be eq([3,2])
    # end

  end



end
