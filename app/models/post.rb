class Post < ApplicationRecord
    belongs_to :user
    
    has_many :likes, as: :likeable
    has_many :comments, as: :commentable

    validates :title, :content, presence: true
end
