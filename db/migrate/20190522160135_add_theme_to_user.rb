class AddThemeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :theme, :integer, :default => 0
  end
end
