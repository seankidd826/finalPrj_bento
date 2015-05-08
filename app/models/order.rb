class Order < ActiveRecord::Base

  attr_accessor :address_area, :address_road

  belongs_to :user
  belongs_to :menu
  validates_presence_of :order_name, :order_address, :order_phone, :menu_id, :menu_count
  validates_numericality_of :menu_count, :only_integer => true

  before_save :setup_total
  after_create :consume_stock
  after_create :fill_user_data

  def total
    self.menu_count.to_i * self.menu.price
  end

  protected
  # 總價直接存在後台
  def setup_total
    self.total_price = self.total
  end

  def consume_stock
    stock = self.menu.in_stock_qty
    stock = stock - self.menu_count
    self.menu.update(:in_stock_qty => stock )
  end

  def fill_user_data
    u = self.user
    if u
      u.name ||= self.order_name
      u.phone ||= self.order_phone
      u.address ||= self.order_address
      u.save!
    end
  end

end
