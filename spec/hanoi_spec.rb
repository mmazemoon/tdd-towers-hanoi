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
      expect(game.towers[2]).to eq([1])
    end

    it "removes a disc from the first tower" do
      expect(game.towers[0]).to eq([3,2])
    end

    it "throws an error if it tries to moves a disc onto a larger disc" do
      expect {game.move_disc(0,2)}.to raise_error(InvalidMoveError)
    end

    it "throws an error if there is no disc to move" do
      expect { game.move_disc(1, 2) }.to raise_error(InvalidMoveError)
    end

  end

end
