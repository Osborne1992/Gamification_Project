class Game < ActiveRecord::Base

  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: "User"
  has_many :moves

  WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def finished?
    winning_game? || drawn_game?
  end

  def result
    case
    when winning_game?
      "#{moves.last.player} won!"
    when drawn_game?
      "It is a draw!"
    else 
      "The game is still in progress..."
    end
  end

  def board
    empty_board.tap do |board|
      moves.each do |move|
        board[move.square] = move.symbol
      end
    end
  end

    def make_move(player, square)
    # if square < 0
    #   puts "Your move was too low, Doofus!"
    #   puts "Hit enter to try again"
    #   gets
    # elsif square > 8
    #   puts "Your move was too high, Doofus!"
    #   puts "Hit enter to try again"
    #   gets
    # elsif board[square] 
    #   puts "Your move has already been played, Doofus!"
    #   puts "Hit enter to try again"
    #   gets
    # else
    Move.new(player: player, square: square, symbol: symbol_for_player(player), game: self)
    # end
  end

  # if player1.empty?
  #   player1 = "Player 1"
  # end
  # if player2.empty?
  #   playerA = "Player 2"
  # end

  # if player1 == player2
  #   player1 = "#{player1}1"
  #   playerA = "#{player2}2"
  # end

  # def whose_turn
  #   return player1 if moves.empty?
  #   moves.last.player == player1 ? player2 : player1
  # end

  private
  def empty_board
    Array.new(9,nil)
  end

  private
  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w(XXX OOO).include?(winning_line.map { |e| board[e] }.join)
    end
  end

  private
  def drawn_game?
    move.size == 9
  end

  private
  def symbol_for_player(player)
    case player
    when player1
      'X'
    when player2
      'O'
    end
  end


end
