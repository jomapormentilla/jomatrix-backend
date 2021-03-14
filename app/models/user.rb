class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    has_secure_password

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, on: :create
end
