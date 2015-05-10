class MenusController < ApplicationController

  def index
    @menu = Menu.last
    @order = Order.new
    @story = Story.last
    @Time_now = Time.now.strftime("%_m /%_d")
    @Time_constraint = Time.now.strftime("%A") == "Saturday" || Time.now.strftime("%A") == "Sunday" || Time.now.strftime("%H")!="9" || Time.now.strftime("%H")!="10" || Time.now.strftime("%H")!="11"

    if current_user
      @order.order_name = current_user.name
      @order.order_phone = current_user.phone
      @order.order_address = current_user.address
    end

  end

end
