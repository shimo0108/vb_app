class Player < ApplicationRecord
  
  belongs_to :user
  validates :user_id, presence: true
  enum gender: %i( 男性　
                  女性 )


end