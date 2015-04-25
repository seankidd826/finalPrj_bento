class Menu < ActiveRecord::Base
  # create many to many (uers) relation
  has_many :user_menus, :dependent => :destroy #when delete menu will also delete related datbase menu_id in  users_menu !?
  has_many :users, :through => :user_menus, :source => "user"

  # create many to many (likes) relation
  has_many :likes
  has_many :user_likes, :through => :likes, :source => "user"

  # create one to many (orders) relation
  has_many :orders, :dependent => :destroy


end
