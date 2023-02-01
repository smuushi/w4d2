require_relative "piece"
require_relative "move_mods"

class Queen < Piece
include Slideable

    def symbol
        if self.color == :white
        :♕ #white
        else
        :♛ #black
        end
    end    



    protected
    def move_dirs

        diagonal_dirs + horizontal_dirs

    end


end