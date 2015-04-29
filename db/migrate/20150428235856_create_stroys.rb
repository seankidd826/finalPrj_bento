class CreateStroys < ActiveRecord::Migration
  def change
    create_table :stroys do |t|
      t.string :momheader
      t.text :momcontents
      t.timestamps null: false
    end
  end
end
