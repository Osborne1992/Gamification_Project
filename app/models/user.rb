class User < ActiveRecord::Base

  has_many :moves
  has_many :games_as_player1, class_name: "Game", foreign_key: :player1_id
  has_many :games_as_player2, class_name: "Game", foreign_key: :player2_id


  # if player1.empty?
  #   player1 = "Player 1"
  # end
  # if playerA.empty?
  #   playerA = "Player A"
  # end

  # if player1 == playerA
  #   player1 = "#{player1}1"
  #   playerA = "#{playerA}A"
  # end

  def whose_turn
    return player1 if moves.empty?
    moves.last.player == player1 ? player2 : player1
  end

  # private
  #   def symbol_for_player(player)
  #     case player
  #     when player1
  #       'X'
  #     when player2
  #       'O'
  #     end
  #   end
  
end
