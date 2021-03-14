class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :friend_id
      t.integer :added_friend_id

      t.timestamps
    end
  end
end
