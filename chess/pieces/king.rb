require_relative 'piece'

class King < Piece

  def symbol
    if self.color == :white
      :♔
    else
      :♚
    end
  end

end