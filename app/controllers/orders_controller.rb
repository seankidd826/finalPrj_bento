class OrdersController < ApplicationController

  def create
    @order = @menu.orders.new(comment_params)
  end


  private
  def order
  end




end
