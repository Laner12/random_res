require 'rails_helper'

RSpec.describe "Restaurant" do
  it "Calls the services for a search and formats the response" do
    presenter = Restaurant.all_by_location.first

    expect(presenter.name).to eq("The Arvada Tavern")
    expect(presenter.rating_img_url_large).to eq("https://s3-media4.fl.yelpcdn.com/assets/2/www/img/9f83790ff7f6/ico/stars/v1/stars_large_4_half.png")
    expect(presenter.review_count).to eq(356)
    expect(presenter.image_url).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/WqEbyDOMSGHMVZmBuS_lXA/ms.jpg")
    expect(presenter.url).to eq("https://www.yelp.com/biz/the-arvada-tavern-arvada?adjust_creative=GDuUHYsncVCRnXKpBt8GIw&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=GDuUHYsncVCRnXKpBt8GIw")
    expect(presenter.distance).to eq(3.5)
    expect(presenter.status).to eq("Currently Open.")
    expect(presenter.status).not_to eq("Currently Closed.")
  end
end
