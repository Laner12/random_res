require 'rails_helper'

RSpec.feature 'User can logout' do
  scenario 'while on the user dashboard, the user clicks logout' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Bobby")
    expect(page).to have_link("Logout")

    click_link "Logout"

    expect(current_path).to eq(root_path)
  end
end
