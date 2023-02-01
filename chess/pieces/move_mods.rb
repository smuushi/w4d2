require 'Singleton'

module Slideable

  HORIZONTAL_DIRS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1]
  ]

  DIAGONAL_DIRS = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]

  def horizontal_dirs 
    return HORIZONTAL_DIRS
  end

  def diagonal_dirs
    return DIAGONAL_DIRS
  end
  
  def move_dirs
    raise ArgumentError.new("NOT IMPLEMENTED PROPERLY")
  end

  def grow_unblocked_moves_in_dir(pos_diff)
    # base case: return self.pos if self.pos + pos_diff == friendly piece
    # base 2: return self.pos if self.pos + pos_diff == OOB
    # base 3: return self.pos + pos_diff if self.pos + pos_diff == enemy piece

    # create unblocked_moves array = nested array starting with one ele of self.pos

    # shovel the recursive call of unblocked_moves[-1].grow_unblocked_moves_in_dir(pos_diff) to holder array
    unblocked_moves = []
    current_row, current_col = self.pos

    dx, dy = pos_diff

    next_row, next_col = current_row + dx, current_col + dy


    while self.board[next_row, next_col] == NullPiece.instance
      unblocked_moves << [next_row, next_col]

      next_row += dx
      next_col += dy
    end

    next_piece = self.board[next_row, next_col]

    if capturable?(next_piece)
      unblocked_moves << [next_row, next_col]
    end


    return unblocked_moves 
  end

  def capturable?(piece_instance)
    return true if piece_instance.color != self.color
    false
  end

end
 # GET THE MOVE DIRECTIONS FROM PIECE#MOVE_DIRS --> dictated and overwritten by the subclass
 # GROW THOSE DIRECTIONS UNTIL BLOCKED BY SOMETHING
 # RETURN ALL THE MOVES IN PIECE#MOVES



module Stepable

end


class Test
  include Singleton
  
  

  def color
    @color
  end
end