require_relative "piece"
require_relative "move_mods"

class Knight < Piece
include Stepable


    def symbol
        if self.color == :white
            :♘ #white
        else
            :♞ #black
        end
    end


    protected
    def move_diffs

        [
            [1,2],
            [1,-2],
            [-1,2],
            [-1,-2],
            [2,1],
            [2,-1],
            [-2,1],
            [-2,-1]
        ]

    end




end
