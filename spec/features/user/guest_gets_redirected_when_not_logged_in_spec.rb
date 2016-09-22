require 'rails_helper'

RSpec.feature 'Guest gets redirected when not logged in' do
  scenario 'guest trys to visit search index path without being logged in' do

    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_button("Google")
    expect(page).not_to have_content("Logout")

    visit '/search/index'

    expect(current_path).to eq(root_path)
  end

  scenario 'guest trys to visit dashboard path without being logged in' do

    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_button("Google")
    expect(page).not_to have_content("Logout")

    visit 'dashboard'

    expect(current_path).to eq(root_path)
  end
end
