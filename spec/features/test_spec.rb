require_relative '../init'
require 'rails_helper'

RSpec.describe 'Search Page', type: :feature do
  it 'includes the word DuckDuckGo' do
    visit 'https://www.duckduckgo.com'
    expect(page).to have_text('DuckDuckGo')
  end
end