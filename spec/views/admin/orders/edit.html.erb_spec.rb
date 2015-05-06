require 'rails_helper'

RSpec.describe "admin/orders/edit", type: :view do
  before(:each) do
    @admin_order = assign(:admin_order, Admin::Order.create!(
      :total_price => "MyString",
      :menu_count => "MyString",
      :order_name => "MyString",
      :order_phone => "MyString",
      :order_address => "MyString",
      :order_email => "MyString"
    ))
  end

  it "renders the edit admin_order form" do
    render

    assert_select "form[action=?][method=?]", admin_order_path(@admin_order), "post" do

      assert_select "input#admin_order_total_price[name=?]", "admin_order[total_price]"

      assert_select "input#admin_order_menu_count[name=?]", "admin_order[menu_count]"

      assert_select "input#admin_order_order_name[name=?]", "admin_order[order_name]"

      assert_select "input#admin_order_order_phone[name=?]", "admin_order[order_phone]"

      assert_select "input#admin_order_order_address[name=?]", "admin_order[order_address]"

      assert_select "input#admin_order_order_email[name=?]", "admin_order[order_email]"
    end
  end
end
