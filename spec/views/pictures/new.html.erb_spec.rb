require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
    assign(:picture, Picture.new(
      :filename => "MyString",
      :content_type => "MyString",
      :file_contents => ""
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input[name=?]", "picture[filename]"

      assert_select "input[name=?]", "picture[content_type]"

      assert_select "input[name=?]", "picture[file_contents]"
    end
  end
end
