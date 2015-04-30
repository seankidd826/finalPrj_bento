class AddMomPicToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :mominfo, :string
  end
end
