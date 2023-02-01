require 'singleton'

module Slideable

  HORIZONTAL_DIRS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1]
].freeze

  DIAGONAL_DIRS = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
].freeze

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
    return true if piece_instance.color != self.color && piece_instance.color != nil
    false
  end

  def moves

    ostensible_moves = []

    move_dirs.each do |direction|
      ostensible_moves += grow_unblocked_moves_in_dir(direction)
    end

    return ostensible_moves

  end

end
 # GET THE MOVE DIRECTIONS FROM PIECE#MOVE_DIRS --> dictated and overwritten by the subclass
 # GROW THOSE DIRECTIONS UNTIL BLOCKED BY SOMETHING
 # RETURN ALL THE MOVES IN PIECE#MOVES



module Stepable

  def move_diffs
    raise ArgumentError.new("NOT IMPLEMENTED PROPERLY")
  end

  # ALL_DIRS = [
  #   [0,1],
  #   [1,0],
  #   [-1,0],
  #   [0,-1],
  #   [1,1],
  #   [-1,1],
  #   [1,-1],
  #   [-1,-1]
  # ]

  def moves
    ostensible_moves = []

    move_diffs.each do |move|
      next_pos = self.pos.dup
      next_pos[0] += move[0]
      next_pos[1] += move[1]
      
      if self.board[next_pos] == NullPiece.instance
        ostensible_moves << next_pos
      end

      if capturable?(self.board[next_pos])
        ostensible_moves << next_pos
      end

      ostensible_moves
    end
  end

  def capturable?(piece_instance)
    return true if piece_instance.color != self.color && piece_instance.color != nil
    false
  end

end


# class Test
#   include Singleton
  


#   def color
#     @color
#   end
# end