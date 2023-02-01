class Piece

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board_inst, pos) # color: symbol, board_inst, pos: 2-ele-arr
    @color = color
    @board = board_inst
    @pos = pos
  end

  def to_s 

    # puts "color: #{color}, pos: #{pos}"

  end
  
  



end