require 'rails_helper'

RSpec.describe "admin/orders/show", type: :view do
  before(:each) do
    @admin_order = assign(:admin_order, Admin::Order.create!(
      :total_price => "Total Price",
      :menu_count => "Menu Count",
      :order_name => "Order Name",
      :order_phone => "Order Phone",
      :order_address => "Order Address",
      :order_email => "Order Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Total Price/)
    expect(rendered).to match(/Menu Count/)
    expect(rendered).to match(/Order Name/)
    expect(rendered).to match(/Order Phone/)
    expect(rendered).to match(/Order Address/)
    expect(rendered).to match(/Order Email/)
  end
end
