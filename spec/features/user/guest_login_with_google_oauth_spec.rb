require 'rails_helper'

RSpec.feature 'Guest login with google oauth' do
  scenario 'while on welcome page guest clicks login with google' do
    setup_for_oauth

    visit '/'

    expect(page).to have_content("Welcome to the best app you never knew you needed!")
    expect(page).to have_content("Would you like to login with")
    expect(page).to have_button("Google")

    click_button "Google"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Bobby")
  end
end
