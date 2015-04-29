class AddPaperclipattachment < ActiveRecord::Migration
  def change
    rename_table :stroys, :storys
    add_attachment :storys, :pic
  end
end
