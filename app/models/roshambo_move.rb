class RoshamboMove < ActiveRecord::Base

  belongs_to :player, class_name: "User"
  belongs_to :roshambo_game

end
