require 'rails_helper'

RSpec.feature 'User can generate search' do
  scenario 'while on the user dashboard, the user clicks generate search' do
    VCR.use_cassette("user_search") do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      visit '/dashboard'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Bobby")
      expect(page).to have_button("Generate Search")

      click_button "Generate Search"

      expect(current_path).to eq(search_index_path)
      expect(page).to have_link("Logout")
      expect(page).to have_content("Ratings: ")
      expect(page).to have_content("Reviews:")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Status: Currently Open.")
    end
  end
end
