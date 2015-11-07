class Board < ActiveRecord::Base

  has_many :moves

  def print_board
    puts(board.each_slice(3).map do |row|
          row.map { |e| e || ' ' }.join(' | ')
        end.join("\n---------\n"))
  end

end
