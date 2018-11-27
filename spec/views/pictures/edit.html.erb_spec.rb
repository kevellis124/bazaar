require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => ""
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input[name=?]", "picture[filename]"

      assert_select "input[name=?]", "picture[content_type]"

      assert_select "input[name=?]", "picture[file_contents]"
    end
  end
end
