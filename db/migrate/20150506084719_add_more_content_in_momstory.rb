class AddMoreContentInMomstory < ActiveRecord::Migration
  def change
    add_column :storys, :momcontents_1, :text
    add_column :storys, :momcontents_2, :text
    add_column :storys, :momcontents_3, :text
  end
end
