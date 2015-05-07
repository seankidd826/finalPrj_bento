require 'rails_helper'

RSpec.describe "admin/stories/index", type: :view do
  before(:each) do
    assign(:admin_stories, [
      Admin::Story.create!(
        :momheader => "Momheader",
        :momcontents => "MyText",
        :momcontents_1 => "MyText",
        :momcontents_2 => "MyText",
        :momcontents_3 => "MyText"
      ),
      Admin::Story.create!(
        :momheader => "Momheader",
        :momcontents => "MyText",
        :momcontents_1 => "MyText",
        :momcontents_2 => "MyText",
        :momcontents_3 => "MyText"
      )
    ])
  end

  it "renders a list of admin/stories" do
    render
    assert_select "tr>td", :text => "Momheader".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
