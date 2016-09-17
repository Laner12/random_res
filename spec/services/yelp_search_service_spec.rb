require 'rails_helper'

RSpec.describe "YelpSearchService", type: :model do
    it "should return data for the businesses in the area" do
      VCR.use_cassette("yelp_service_location") do
      yelp_response = YelpSearchService.new
      location_coordinates = "39.8027644,-105.08748419999999"
      action = yelp_response.api_call(location_coordinates)
      keys = ["is_claimed", "rating", "mobile_url", "rating_img_url", "review_count", "name", "snippet_image_url", "rating_img_url_small", "url", "categories", "phone", "snippet_text", "image_url", "location", "display_phone", "rating_img_url_large", "id", "is_closed", "distance"]

      expect(action).to be_kind_of(Array)
      expect(action[0]).to be_kind_of(Hash)
      expect(action[0].keys).to eq(keys)
      expect(action[0].keys.count).to eq(19)
    end
  end
end
