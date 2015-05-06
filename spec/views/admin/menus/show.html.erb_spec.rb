require 'rails_helper'

RSpec.describe "admin/menus/show", type: :view do
  before(:each) do
    @admin_menu = assign(:admin_menu, Admin::Menu.create!(
      :title => "Title",
      :contents => "MyText",
      :price => "Price",
      :likes_count => "Likes Count",
      :in_stock_qty => "In Stock Qty",
      :mominfo => "Mominfo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Likes Count/)
    expect(rendered).to match(/In Stock Qty/)
    expect(rendered).to match(/Mominfo/)
  end
end
