require 'byebug'

class Board
  attr_accessor :cups, :player1, :player2, :end_idx

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @player1 = name1
    @player2 = name2
  end


  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    four_stone_arr = [:stone, :stone, :stone, :stone]
    (0..5).each { |i|  @cups[i] = four_stone_arr.dup }
    (7..12).each { |i|  @cups[i] = four_stone_arr.dup }
  end


  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Starting cup is empty' if @cups[start_pos].length == 0
  end


  def make_move(start_pos, current_player_name)
    i = start_pos
    num_stones = @cups[start_pos].length
    while @cups[start_pos].length > 0
      i += 1
      i = i % 14
      next if ( (i == 13) && current_player_name == @player1)
      next if ( (i == 6) && current_player_name == @player2)
      @cups[i] << @cups[start_pos].pop
      @end_idx = i
    end
    render
    next_turn(@end_idx)
  end


  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    num_stones =  @cups[ending_cup_idx].length

    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif num_stones == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    num_stones = 0
    (0..5).each { |i| num_stones += @cups[i].length }
    return true if num_stones == 0

    num_stones = 0
    (7..12).each { |i| num_stones += @cups[i].length }
    return true if num_stones == 0

    false
  end

  def winner
    case @cups[13].length <=> @cups[6].length
    when 0
      :draw
    when -1
      @player1
    when 1
      @player2
    end
  end

end
