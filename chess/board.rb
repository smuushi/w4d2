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

  attr_reader :grid

  def make_board
    grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
   
    return grid
  end

  def initialize
    @grid = self.make_board  # 2-d array with nils in rows 2..5
    self.make_white_side
    self.make_black_side
  end

  def make_white_side
    @grid[0].each_index do |col| 
      
      new_rook = Rook.new(:white, self, [0, col]) if col == 0 || col == 7
      self.[]=([0,col],new_rook) if col == 0 || col == 7

      new_knight = Knight.new(:white, self, [0,col]) if col == 1 || col == 6
      self.[]=([0,col],new_knight) if col == 1 || col == 6

      new_bishop = Bishop.new(:white, self, [0, col]) if col == 2 || col == 5
      self.[]=([0,col],new_bishop) if col == 2 || col == 5

      new_queen = Queen.new(:white, self, [0, col]) if col == 3
      self.[]=([0,col],new_queen) if col == 3

      new_king = King.new(:white, self, [0,col]) if col == 4
      self.[]=([0,col],new_king) if col == 4

    end

    @grid[1].each_index do |col| 
      new_pawn = Pawn.new(:white, self, [1, col])
      self.[]=([1,col],new_pawn)
    end

  end

  def make_black_side

    @grid[6].each_index do |col|
      new_pawn = Pawn.new(:black, self, [6,col]) 
      self.[]=([6,col], new_pawn)
    end

    @grid[7].each_index do |col|
      if col == 0 || col == 7
        new_rook = Rook.new(:black, self, [7, col])
        self.[]=([7,col],new_rook)
      end

      if col == 1 || col == 6
        new_knight = Knight.new(:black, self, [7,col]) 
        self.[]=([7,col],new_knight) 
      end

      if col == 2 || col == 5
        new_bishop = Bishop.new(:black, self, [7, col]) 
        self.[]=([7,col],new_bishop)
      end

      if col == 3
        new_queen = Queen.new(:black, self, [7, col])
        self.[]=([7,col],new_queen)
      end

      if col == 4
        new_king = King.new(:black, self, [7,col])
        self.[]=([7,col],new_king)
      end

    end

  end


  def [](row,col)
    return @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos[0], pos[1]
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos) # NILner was here
    raise ArgumentError.new('No piece in start pos') if self[start_pos] == NullPiece.instance
    raise ArgumentError.new('Cannot move to end pos') if self[end_pos] != NullPiece.instance
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
  end


end


