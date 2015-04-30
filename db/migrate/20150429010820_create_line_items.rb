class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :menu_id
      t.integer :cart_id
      t.integer :gty
      t.integer :order_id
      t.timestamps null: false
    end
    add_index :line_items, :order_id
    add_index :line_items, :cart_id
    add_index :line_items, :menu_id
  end
end
