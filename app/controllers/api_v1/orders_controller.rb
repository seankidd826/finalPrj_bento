class ApiV1::OrdersController < ApiController

  def create
    @order = Order.new( menu_id: params[:menu_id],
                        menu_count: params[:menu_count],
                        order_name: params[:name],
                        order_phone: params[:phone],
                        order_address: params[:address],
                        order_email: params[:email] )

    @order.user = current_user

    if @order.save
      render :json => { :message => "OK", :order_id => @order.id }
    else
      render :json => { :errors => @order.errors.full_messages }, :status => 400
    end
  end

  def index
    @orders = Menu.last.orders.order(:created_at => :desc).page(params[:page]).per(3)
  end


end
