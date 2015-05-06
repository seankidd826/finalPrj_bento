require 'rails_helper'

RSpec.describe "admin/menus/edit", type: :view do
  before(:each) do
    @admin_menu = assign(:admin_menu, Admin::Menu.create!(
      :title => "MyString",
      :contents => "MyText",
      :price => "MyString",
      :likes_count => "MyString",
      :in_stock_qty => "MyString",
      :mominfo => "MyString"
    ))
  end

  it "renders the edit admin_menu form" do
    render

    assert_select "form[action=?][method=?]", admin_menu_path(@admin_menu), "post" do

      assert_select "input#admin_menu_title[name=?]", "admin_menu[title]"

      assert_select "textarea#admin_menu_contents[name=?]", "admin_menu[contents]"

      assert_select "input#admin_menu_price[name=?]", "admin_menu[price]"

      assert_select "input#admin_menu_likes_count[name=?]", "admin_menu[likes_count]"

      assert_select "input#admin_menu_in_stock_qty[name=?]", "admin_menu[in_stock_qty]"

      assert_select "input#admin_menu_mominfo[name=?]", "admin_menu[mominfo]"
    end
  end
end
