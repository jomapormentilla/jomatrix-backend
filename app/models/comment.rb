class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :user

    has_many :likes, as: :likeable

    validates :content, presence: true
end
