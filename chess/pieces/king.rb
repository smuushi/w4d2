require_relative 'piece'
require_relative 'move_mods'

class King < Piece
include Stepable
  def symbol
    if self.color == :white
      :♔ #white
    else
      :♚ #black
    end
  end

  protected
  def move_diffs 
    [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1],
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]
  end

end