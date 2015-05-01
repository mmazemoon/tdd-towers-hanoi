class InvalidMoveError < StandardError
  def message
    puts "You can't make that move!"
  end
end

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

  def move_disc(from_tower, to_tower)
    raise InvalidMoveError if @towers[from_tower].empty?
    unless @towers[to_tower].empty?
      raise InvalidMoveError if @towers[from_tower].last > @towers[to_tower].last
    end
    @towers[to_tower] << @towers[from_tower].pop
  end

  def play
    render
    puts "Welcome to the exotic land of Hanoi. Enjoy your stay!"
    until game_won?
      puts "From what tower to which tower would you like to move?"
      input = gets.chomp.split.map { |char| char.to_i }
      move_disc(input[0], input[1])
      render
    end
    puts "Congratulations!"
  end

  def render
     p @towers
  end

  def game_won?
    @towers[0].empty? && @towers[1].empty? && @towers[2] == @victory_state
  end
end

game = Hanoi.new(2)
game.play
