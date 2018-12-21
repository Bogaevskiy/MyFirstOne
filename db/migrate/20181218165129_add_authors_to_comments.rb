class AddAuthorsToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :author_name, :string
  end
end
