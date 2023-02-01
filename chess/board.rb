require_relative 'pieces/piece'
require_relative 'pieces/nullpiece.rb'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/move_mods'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative "pieces/pawn"


class Board

  def make_board
    grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
    
    # grid[0..1].each do |row|
    #   row.each_index { |i| row[i] = Piece.new(:white, self, [0,0])}
    # end

    # grid[2..5].each do |row|
    #   row.each_index { |i| row[i] = NullPiece.instance }
    # end

    # grid[6..7].each do |row|
    #   row.each_index { |i| row[i] = Piece.new(:black, self, [0,0])}
    # end

    return grid
  end

  def initialize
    @grid = self.make_board  # 2-d array with nils in rows 2..5
    self.make_pawns_1
    self.make_pawns_2
  end

  def make_pawns_1
    (0..7).each { |col| @grid[1, col] = Pawn.new(:white, @grid, [1, col])}
  end
  def make_pawns_2
    (0..7).each { |col| @grid[6, col] = Pawn.new(:black, @grid, [6, col])}
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    return @grid[row][col]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos) # NILner was here
    raise ArgumentError.new('No piece in start pos') if self[start_pos] == nil
    raise ArgumentError.new('Cannot move to end pos') if self[end_pos] != nil
    self[start_pos], self[end_pos] = nil, self[start_pos]
  end


end


bord = Board.new
puts bord[0, 1]
puts bord[1, 4]
puts bord[6, 3]
puts bord[4, 4]
puts bord