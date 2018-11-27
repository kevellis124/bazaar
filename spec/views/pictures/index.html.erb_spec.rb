require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => ""
      ),
      Picture.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_contents => ""
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
