class AddModelForConfirmation < ActiveRecord::Migration
  def change
    rename_column :line_items, :gty, :qty
  end
end
