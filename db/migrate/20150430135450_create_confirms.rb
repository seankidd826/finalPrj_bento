class CreateConfirms < ActiveRecord::Migration
  def change
    create_table :confirms do |t|
      t.string   :confirm_name
      t.string   :confirm_phone
      t.text     :confirm_address
      t.integer  :confirm_menu_count
      t.integer  :confirm_menu_id
      t.integer  :confirm_user_id
      t.integer  :confirm_total_price

      t.timestamps null: false
    end
    add_index :confirms, :confirm_menu_id
    add_index :confirms, :confirm_user_id
  end
end
