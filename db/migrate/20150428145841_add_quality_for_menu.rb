class AddQualityForMenu < ActiveRecord::Migration
  def change
    add_column :menus, :in_stock_qty, :integer, :default => 10
  end
end
