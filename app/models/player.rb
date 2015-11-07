class Player < ActiveRecord::Base

  has_many :moves

  puts "What is Player 1's name? "
  g.player1 = gets.chomp
  if g.player1.empty?
    g.player1 = "Player 1"
  end
  puts
  puts "What is Player A's name? "
  g.playerA = gets.chomp
  if g.playerA.empty?
    g.playerA = "Player A"
  end

  if g.player1 == g.playerA
    g.player1 = "#{g.player1}1"
    g.playerA = "#{g.playerA}A"
  end

end
