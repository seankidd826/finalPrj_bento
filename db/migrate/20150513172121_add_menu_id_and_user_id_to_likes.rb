class AddMenuIdAndUserIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :menu_id, :integer
    add_column :likes, :user_id, :integer
    add_index :likes, :menu_id
    add_index :likes, :user_id
  end

end
