require 'allpay'
class AllpayController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trade

  def result
    if @trade.save

      redirect_to user_orders_path(current_user), notice: '交易成功'
    else
      redirect_to user_orders_path(current_user), alert: '交易失敗'
    end
  end

private

  def set_trade
    @trade = Trade.find_and_initialize_by_allpay(request.POST)
  end

end