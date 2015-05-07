require 'rails_helper'

RSpec.describe "admin/stories/show", type: :view do
  before(:each) do
    @admin_story = assign(:admin_story, Admin::Story.create!(
      :momheader => "Momheader",
      :momcontents => "MyText",
      :momcontents_1 => "MyText",
      :momcontents_2 => "MyText",
      :momcontents_3 => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Momheader/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
