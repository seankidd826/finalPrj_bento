require 'rails_helper'

RSpec.describe "admin/orders/index", type: :view do
  before(:each) do
    assign(:admin_orders, [
      Admin::Order.create!(
        :total_price => "Total Price",
        :menu_count => "Menu Count",
        :order_name => "Order Name",
        :order_phone => "Order Phone",
        :order_address => "Order Address",
        :order_email => "Order Email"
      ),
      Admin::Order.create!(
        :total_price => "Total Price",
        :menu_count => "Menu Count",
        :order_name => "Order Name",
        :order_phone => "Order Phone",
        :order_address => "Order Address",
        :order_email => "Order Email"
      )
    ])
  end

  it "renders a list of admin/orders" do
    render
    assert_select "tr>td", :text => "Total Price".to_s, :count => 2
    assert_select "tr>td", :text => "Menu Count".to_s, :count => 2
    assert_select "tr>td", :text => "Order Name".to_s, :count => 2
    assert_select "tr>td", :text => "Order Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Order Address".to_s, :count => 2
    assert_select "tr>td", :text => "Order Email".to_s, :count => 2
  end
end
