class C4Game < ActiveRecord::Base

  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: "User"
  has_many :c4_moves


  WINNING_LINES = [  ]

  def finished?
    winning_game? || drawn_game?
  end

  def drawn_game?
    moves.size == 42
  end

  def winning_player?(player)
    winning_game? && moves.last.player == player
  end

  def losing_player?(player)
    winning_game? && moves.last.player != player
  end

  def my_turn?(player)
    whose_turn && moves.last.player == player
  end

  def result
    case
    when winning_game?
      "#{moves.last.player.username} has won!"
    when drawn_game?
      "It's a draw! Well played, both sides!"
    else 
      "Battle in progress... It's anyone's game!"
    end
  end

  def board
    empty_board.tap do |board|
      moves.each do |move|
        board[move.square] = move.token
      end
    end
  end

  def has_move_at_square(square)
    moves.any? { |move| move.square == square }
  end

  def move_at_square(square)
    moves.find { |move| move.square == square }
  end

  def make_move(player, square)  
    if move_check(player)
      Move.create(player: player, square: square, token: token_for_player(player), game: self)
    end
    p = whose_turn
    if p.username == "SkyNET(AI)" && !finished?
      square = board.each_with_index.map { |s, i| s ? nil : i }.compact.sample
      Move.create!(player: p, square: square, token: token_for_player(p), game: self)
    end
  end

  def whose_turn
    return player1 if moves.empty?
    moves.last.player == player1 ? player2 : player1
  end

  def move_check(player)
    player == whose_turn
  end

  def can_make_move?(player)
    move_check(player) && !finished?
  end

  private
  def empty_board
    { 1 => Array.new(6,nil),
    2 => Array.new(6,nil),
    3 => Array.new(6,nil),
    4 => Array.new(6,nil),
    5 => Array.new(6,nil),
    6 => Array.new(6,nil),
    7 => Array.new(6,nil) }
  end

  private
  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w((P1)(P1)(P1) (P2)(P2)(P2)).include?(winning_line.map { |e| board[e] }.join)
    end
  end

  private
  def token_for_player(player)
    case player
    when player1
      '(P1)'
    when player2
      '(P2)'
    end
  end


end
