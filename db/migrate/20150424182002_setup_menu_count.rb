class SetupMenuCount < ActiveRecord::Migration
  def change
    add_column :menus, :likes_count, :integer, :default => 0
  end
end
