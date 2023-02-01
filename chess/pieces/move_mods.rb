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
  end

end
 # GET THE MOVE DIRECTIONS FROM PIECE#MOVE_DIRS --> dictated and overwritten by the subclass
 # GROW THOSE DIRECTIONS UNTIL BLOCKED BY SOMETHING
 # RETURN ALL THE MOVES IN PIECE#MOVES



module Stepable

end