class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.text :contents
      t.integer :price
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
