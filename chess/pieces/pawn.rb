require_relative 'piece'

class Pawn < Piece

  
  
  def forward_dir
    if self.color == :white
      return 1
    else
      return -1
    end
  end

  def at_start_row?
    row, col = self.pos

    if self.color == :white
      return true if row == 1
    else
      return true if row == 6
    end

    false
  end

  def forward_steps
    ostensible_steps = []
    row, col = self.pos

    if at_start_row?
      ostensible_steps << [row + forward_dir, col]
      ostensible_steps << [row + (2 * forward_dir), col]
    else
      ostensible_steps << [row + forward_dir, col]
    end
  end

  def symbol
    if self.color == :white
      :♙ #white
    else
      :♟ #black
    end
  end  


end