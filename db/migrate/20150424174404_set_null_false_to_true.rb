class SetNullFalseToTrue < ActiveRecord::Migration
  def change
    change_column_null :users, :name, true
    change_column_null :users, :phone, true
    change_column_null :users, :address, true
  end
end
