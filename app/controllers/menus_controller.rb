class MenusController < ApplicationController

  def index
    @menu = Menu.last
    @order = Order.new
    @story = Story.last

    if current_user
      @order.order_name = current_user.name
      @order.order_phone = current_user.phone
      @order.order_address = current_user.address
    end

  end

end
