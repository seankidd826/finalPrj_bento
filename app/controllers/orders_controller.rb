require 'allpay'
class OrdersController < ApplicationController

  def confirm
    @menu = Menu.find(params[:menu_id])

    # combine select menu and text_field
    full_order_address = params[:order][:order_address] || params[:order][:address_area] + params[:order][:address_road]
    @order = @menu.orders.new(order_params)
    # re-assign order_address with new combined address
    @order.order_address = full_order_address
      respond_to do |format|
       format.html {render :template => "menus/wrong"}
       format.js {
         render :template => "orders/confirm"
       }
      end
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new(order_params)

    @order.user = current_user

    if @menu.enough?(@order.menu_count)
      if @order.save
       redirect_to menu_path(@menu)
      else
       render :template => "menus/wrong"
      end
    else
     render :template => "menus/out_of_stock"
    end
  end

  def checkout

    order = Order.find(params[:order_id])
    order.update(:payment_method => "Credit")
    if order.paid?
      redirect_to user_orders_path(current_user), notice: '已經付過款'
    else
      trade = order.trades.create!
      allpay = Allpay.new
      @checkout_params = {
        MerchantID: allpay.merchant_id,
        MerchantTradeNo: trade.trade_number,
        MerchantTradeDate: Time.now.strftime('%Y/%m/%d %H:%M:%S'),
        PaymentType: :aio,
        TotalAmount: order.total_price,
        TradeDesc: :'My Order',
        ItemName: :"便當",
        ChoosePayment: order.payment_method,
        ReturnURL: 'http://requestb.in/131oj771',
        OrderResultURL: allpay_result_url
      }
      @checkout_params[:CheckMacValue] = allpay.make_mac(@checkout_params)
    end
  end


  def index
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  private

  def order_params
    params.require(:order).permit(:order_name,:order_phone,:order_address,:menu_count,:payment_method,:status,:total_price,:menu_id,:user_id,:order_email,:from_phone,:road,:area)
  end

end
