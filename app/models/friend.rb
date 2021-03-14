class Friend < ApplicationRecord
    belongs_to :friend, class_name: "User"
    belongs_to :added_friend, class_name: "User"
end
