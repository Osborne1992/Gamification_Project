class User < ActiveRecord::Base

  has_many :moves
  has_many :games_as_player1, class_name: "Game", foreign_key: :player1_id
  has_many :games_as_player2, class_name: "Game", foreign_key: :player2_id
  
end
