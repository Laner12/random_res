require 'rails_helper'

RSpec.feature 'User can return to dashboard' do
  scenario 'user clicks generate search then clicks RandomRes' do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Bobby")
    expect(page).to have_button("Generate Search")

    click_button "Generate Search"

    expect(current_path).to eq(search_index_path)

    expect(page).to have_link("RandomRes")

    click_link "RandomRes"

    expect(current_path).to eq(dashboard_path)
  end
end
