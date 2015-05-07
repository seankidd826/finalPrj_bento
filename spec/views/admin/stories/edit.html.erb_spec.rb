require 'rails_helper'

RSpec.describe "admin/stories/edit", type: :view do
  before(:each) do
    @admin_story = assign(:admin_story, Admin::Story.create!(
      :momheader => "MyString",
      :momcontents => "MyText",
      :momcontents_1 => "MyText",
      :momcontents_2 => "MyText",
      :momcontents_3 => "MyText"
    ))
  end

  it "renders the edit admin_story form" do
    render

    assert_select "form[action=?][method=?]", admin_story_path(@admin_story), "post" do

      assert_select "input#admin_story_momheader[name=?]", "admin_story[momheader]"

      assert_select "textarea#admin_story_momcontents[name=?]", "admin_story[momcontents]"

      assert_select "textarea#admin_story_momcontents_1[name=?]", "admin_story[momcontents_1]"

      assert_select "textarea#admin_story_momcontents_2[name=?]", "admin_story[momcontents_2]"

      assert_select "textarea#admin_story_momcontents_3[name=?]", "admin_story[momcontents_3]"
    end
  end
end
