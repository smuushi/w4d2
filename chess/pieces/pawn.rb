require_relative 'piece'

class Pawn < Piece

  private
  
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

    return ostensible_steps
  end

  def side_attacks

    ostensible_steps = []
    row, col = self.pos

    if self.board[row + forward_dir, col + 1] != NullPiece.instance 
      if capturable?(self.board[row + forward_dir, col + 1])
        ostensible_steps << [row + forward_dir, col + 1]
      end
    end
    
    if self.board[row + forward_dir, col - 1]
      if capturable?(self.board[row + forward_dir, col - 1])
        ostensible_steps << [row + forward_dir, col - 1]
      end
    end   

    return ostensible_steps
  end

  def capturable?(piece_instance)
    return true if piece_instance.color != self.color && piece_instance.color != nil
    false
  end

public

  def moves
    forward_steps + side_attacks
  end

  def symbol
    if self.color == :white
      :♙ #white
    else
      :♟ #black
    end
  end  


end