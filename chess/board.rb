require_relative 'pieces'

class Board

  def self.make_board
    return Array.new(8) {Array.new(8) {Piece.new}}
  end

  def initialize
    @rows = Board.make_board  # 2-d array with nils
  end

  def [](pos)
    row, col = pos[0], pos[1]
    return @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos[0], pos[1]
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos) # NILner was here
    raise ArgumentError.new('No piece in start pos')
    raise ArgumentError.new('Cannot move to end pos')
    self[start_pos], self[end_pos] = nil, self[start_pos]
  end


end


