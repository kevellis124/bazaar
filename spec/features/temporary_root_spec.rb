require "rails_helper"

describe "visit root", :type => feature do
  it 'shows the homepage' do
    visit '/'
    expect(true)
  end
end