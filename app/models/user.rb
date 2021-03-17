class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    has_many :user_friends, class_name: "Friend", foreign_key: "friend_id"
    has_many :friends, through: :user_friends

    has_many :user_added_friends, class_name: "Friend", foreign_key: "added_friend_id"
    has_many :added_friends, through: :user_added_friends

    has_secure_password

    has_one_attached :image

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, on: :create
end
