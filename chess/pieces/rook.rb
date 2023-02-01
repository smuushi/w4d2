require_relative "piece"
require_relative "move_mods"

class Rook < Piece
include Slideable

    def symbol
        if self.color == :white
        :♖ #white
        else
        :♜ #black
        end
    end    



    protected
    def move_dirs

        horizontal_dirs

    end


end