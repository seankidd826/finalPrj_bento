class ChangeStoryTostories < ActiveRecord::Migration
  def change
    rename_table :storys, :stories
  end
end
