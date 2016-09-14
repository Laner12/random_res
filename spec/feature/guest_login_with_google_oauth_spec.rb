require 'rails_helper'

RSpec.feature 'Guest login with google oauth' do
  scenario 'while on welcome page guest clicks login with google' do
    visit '/'

    expect(page).to have_content("Welcome to the best app you never knew you needed!")
    expect(page).to have_content("Would you like to login with")
    expect(page).to have_link("Google")

    click_on "Google"

    expect(current_path).to eq(dashboard_path)
  end
end
