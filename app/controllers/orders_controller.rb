class OrdersController < ApplicationController

  def create
    @order = @menu.orders.new(comment_params)
  end


  private
  def


end
