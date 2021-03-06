class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role


  has_many :moves
  has_many :games_as_player1, class_name: "Game", foreign_key: :player1_id
  has_many :games_as_player2, class_name: "Game", foreign_key: :player2_id

  before_create :set_default_role


  def role?(role_to_compare_to)
   role_to_compare_to.to_s == self.role.try(:name).to_s
  end

  def games
    games_as_player1 + games_as_player2
  end

  def win_count
    games.select { |game| game.winning_player?(self) }.count
  end

  def lose_count
    games.select { |game| game.losing_player?(self) }.count
  end

  def draw_count
    games.select { |game| game.drawn_game? }.count
  end

  def win_lose_ratio
    if lose_count == 0
      win_count > 0 ? 1 : 0 
    else
      (win_count.to_f / lose_count.to_f).round(2)
    end
  end


 private
 def set_default_role
   self.role ||= Role.find_by_name('registered')
 end
 
end

