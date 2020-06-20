class PlayerPosition < ApplicationRecord
  belongs_to :player, dependent: :destroy
  belongs_to :position, dependent: :destroy
end
