class Hanoi
  attr_accessor :towers, :victory_state

  def initialize(number_of_discs)
    @victory_state = [*(1..number_of_discs)].reverse

    @towers = [
      [*(1..number_of_discs)].reverse,
      [],
      []
    ]
  end

  def move_disc(from_peg, to_peg)

  end

  def play
    
  end

  def parse_input

  end

  def render
     p @towers
  end

  def game_won?
    #[[], []]
    @towers[0].empty? && @towers[1].empty? && @towers[2] == @victory_state
  end
end
