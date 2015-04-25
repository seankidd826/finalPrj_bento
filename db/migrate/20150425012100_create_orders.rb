class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :menu_id
      t.integer :user_id
      t.integer :total_price, :default =>0
      t.integer :menu_count, :default =>0

      t.timestamps null: false
    end
  end
end
