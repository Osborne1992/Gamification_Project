class HomeController < ApplicationController

  def index

  end

  def print_board(g)
    puts(g.board.each_slice(3).map do |row|
          row.map { |e| e || ' ' }.join(' | ')
        end.join("\n---------\n"))
  end

  g = Game.new

  until g.finished?
    puts `clear`
    puts "Remember the boxes go:"
    puts "0 | 1 | 2"
    puts "---------"
    puts "3 | 4 | 5"
    puts "---------"
    puts "6 | 7 | 8"
    puts
    puts print_board(g)
    puts
    puts "#{g.whose_turn}, make your move:"
    print "--> "
    input = gets.chomp
    if input =~ /[[:digit:]]/
      g.make_move g.whose_turn, input.to_i
    else
      puts "Your move was invalid, Doofus!"
      puts "Enter a number from 0 to 8!"
      puts "Press enter to continue"
      gets
    end
    
  end

end