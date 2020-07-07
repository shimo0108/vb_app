class Position < ApplicationRecord
  has_many :player_positions
  has_many :players, through: :player_positions
  has_many :team_positions
  has_many :teams, through: :team_positions
end
