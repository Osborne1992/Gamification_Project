class RoshamboGame < ActiveRecord::Base

  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"
  has_many :roshambo_moves

WINNING_COMBOS = [
  ["lizard"   > "paper"   ],
  ["lizard"   > "spock"   ],
  ["paper"    > "rock"    ],
  ["paper"    > "spock"   ],
  ["rock"     > "lizard"  ],
  ["rock"     > "scissors"],
  ["scissors" > "lizard"  ],
  ["scissors" > "paper"   ],
  ["spock"    > "rock"    ],
  ["spock"    > "scissors"]
]

SHAPES = [
  [0 => "lizard"],
  [1 => "paper"],
  [2 => "rock"],
  [3 => "scissor"],
  [4 => "spock"],
]


  def make_move(player, shape)
    RoshamboMove.create(player: player, shape: shape)
  end

  def winning_move
    @roshambo_moves 
  end


end
