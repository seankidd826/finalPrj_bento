class CreateUserMenus < ActiveRecord::Migration
  def change
    create_table :user_menus do |t|
      t.integer :user_id
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
