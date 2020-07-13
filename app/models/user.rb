# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  has_many :microposts, dependent: :destroy
  has_many :active_follow_members, class_name: "FollowMember", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follow_members, source: :followed
  has_many :passive_follow_members, class_name: "FollowMember", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follow_members, source: :follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_one :player, dependent: :destroy
  has_one :team, dependent: :destroy
  has_one_attached :image

  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }

  def self.from_omniauth(auth)
    find_or_initialize_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.nickname = auth["info"]["nickname"]
      user.password = Devise.friendly_token[0, 20]
      user.email = User.dumy_email(auth)
      user.first_name = auth[:info][:name]
      user.last_name = auth[:info][:name]
    end
  end

  def feed
    following_ids = "SELECT followed_id FROM follow_members
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_follow_members.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

  def self.dumy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
