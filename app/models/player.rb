class Player < ApplicationRecord
  
  belongs_to :user
  validates :user_id,presence:true
  enum gender:{female:0, male:1}
end