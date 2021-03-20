class AddLocationToPostsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :location, :string
  end
end
