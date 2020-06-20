class Position < ApplicationRecord
  has_many :player_positions
  has_many :players, through: :player_positions

  accepts_nested_attributes_for :player_positions, allow_destroy: true
end
