class ApiV1::OrdersController < ApiController
  def index
    @orders = Order.all
  end
end
