class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
