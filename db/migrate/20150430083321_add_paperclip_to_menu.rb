class AddPaperclipToMenu < ActiveRecord::Migration
  def change
    add_attachment :menus, :mompic
  end
end
