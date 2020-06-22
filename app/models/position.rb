class Position < ApplicationRecord
  has_many :PlayerPositions
  has_many :players, through: :PlayerPositions
end
