class C4Move < ActiveRecord::Base

  belongs_to :player, class_name: "User"
  belongs_to :c4_game

end
