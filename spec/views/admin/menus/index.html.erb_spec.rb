require 'rails_helper'

RSpec.describe "admin/menus/index", type: :view do
  before(:each) do
    assign(:admin_menus, [
      Admin::Menu.create!(
        :title => "Title",
        :contents => "MyText",
        :price => "Price",
        :likes_count => "Likes Count",
        :in_stock_qty => "In Stock Qty",
        :mominfo => "Mominfo"
      ),
      Admin::Menu.create!(
        :title => "Title",
        :contents => "MyText",
        :price => "Price",
        :likes_count => "Likes Count",
        :in_stock_qty => "In Stock Qty",
        :mominfo => "Mominfo"
      )
    ])
  end

  it "renders a list of admin/menus" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Likes Count".to_s, :count => 2
    assert_select "tr>td", :text => "In Stock Qty".to_s, :count => 2
    assert_select "tr>td", :text => "Mominfo".to_s, :count => 2
  end
end
