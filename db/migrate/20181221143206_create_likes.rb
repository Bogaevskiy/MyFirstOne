class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :liked_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :liked_id
  end
end
