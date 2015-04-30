class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  validates_numericality_of :menu_count, :only_integer => true
  validates_numericality_of :total_price, :only_integer => true, :greater_than => 1

end
