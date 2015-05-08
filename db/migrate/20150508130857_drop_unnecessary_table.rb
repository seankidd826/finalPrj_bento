class DropUnnecessaryTable < ActiveRecord::Migration
  def change
    drop_table :confirms
    drop_table :carts
    drop_table :line_items
  end
end
