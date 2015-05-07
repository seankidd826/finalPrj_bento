class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  validates_presence_of :order_phone
  validates_numericality_of :menu_count, :only_integer => true
  before_validation :setup_total
  after_create :consume_stock

  def total
    self.menu_count * self.menu.price
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

end
