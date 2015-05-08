class AddAuthenticationTokenToUsers < ActiveRecord::Migration

  def change
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :fb_token

    add_column :users, :authentication_token, :string
    add_column :users, :fb_access_token, :string
    add_column :users, :fb_expires_at, :datetime

    add_index :users, :authentication_token, :unique => true
    add_index :users, :fb_uid
  end

end
