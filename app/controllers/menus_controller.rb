class MenusController < ApplicationController
  # before_action :authenticate_user!

  def index
    @menus = Menu.all
    @order = Order.new
  end

end
