require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    #purposely left blank
  end

  def moves  
    #purposely left blank   
  end

  def symbol
    #purposely left blank
  end


end