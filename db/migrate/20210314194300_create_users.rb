class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :username
      t.text :email
      t.text :password_digest
      t.text :website
      t.text :bio
      t.text :gender

      t.timestamps
    end
  end
end
