class MenusController < ApplicationController

  def index
    @menu = Menu.last
    @order = Order.new
    @story = Story.last
  end

end
