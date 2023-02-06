require_relative "board"
require "colorize"
require_relative "cursor"

class Display

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
        
    end

    def render

        @board.grid.each do |row|
            row_render = []
            row.each do |piece|
               row_render << piece.to_s 
            end
            row_string = row_render.join(" ").to_s
            puts row_string
        end

        return nil
    end


end