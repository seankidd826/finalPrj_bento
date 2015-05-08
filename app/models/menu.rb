class Menu < ActiveRecord::Base
  # create many to many (uers) relation
  has_many :user_menus, :dependent => :destroy #when delete menu will also delete related datbase menu_id in  users_menu !?
  has_many :users, :through => :user_menus, :source => "user"

  # create many to many (likes) relation
  has_many :likes
  has_many :user_likes, :through => :likes, :source => "user"

  # create one to many (orders) relation
  has_many :orders, :dependent => :destroy


  has_attached_file :mompic, :styles => { :large => "600x600>", :medium => "300x300>", :small => "250x250>", :thumb => "100x100>",:special => "500x300>" }, :default_url => "/images/:style/missing.png",
  :path => ":rails_root/public/system/menus/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :mompic, :content_type => /\Aimage\/.*\Z/
  validates_numericality_of :in_stock_qty, :only_integer => true
  validates_numericality_of :price, :only_integer => true, :greater_than => 1

  def menu_date
    self.created_at.strftime("%_m /%_d")
  end

  def chef_name
    mominfo.at(0..5)
  end

  def chef_experience
    mominfo.at(7..13)
  end



end
