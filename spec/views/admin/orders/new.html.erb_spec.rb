require 'rails_helper'

RSpec.describe "admin/orders/new", type: :view do
  before(:each) do
    assign(:admin_order, Admin::Order.new(
      :total_price => "MyString",
      :menu_count => "MyString",
      :order_name => "MyString",
      :order_phone => "MyString",
      :order_address => "MyString",
      :order_email => "MyString"
    ))
  end

  it "renders new admin_order form" do
    render

    assert_select "form[action=?][method=?]", admin_orders_path, "post" do

      assert_select "input#admin_order_total_price[name=?]", "admin_order[total_price]"

      assert_select "input#admin_order_menu_count[name=?]", "admin_order[menu_count]"

      assert_select "input#admin_order_order_name[name=?]", "admin_order[order_name]"

      assert_select "input#admin_order_order_phone[name=?]", "admin_order[order_phone]"

      assert_select "input#admin_order_order_address[name=?]", "admin_order[order_address]"

      assert_select "input#admin_order_order_email[name=?]", "admin_order[order_email]"
    end
  end
end
