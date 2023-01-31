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

  def DIAGONAL_DIRS
    return DIAGONAL_DIRS
  end
  

end
 # GET THE MOVE DIRECTIONS FROM PIECE#MOVE_DIRS --> dictated and overwritten by the subclass
 # GROW THOSE DIRECTIONS UNTIL BLOCKED BY SOMETHING
 # RETURN ALL THE MOVES IN PIECE#MOVES

module Stepable

end