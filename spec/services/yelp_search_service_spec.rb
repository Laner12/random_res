require 'rails_helper'

RSpec.describe "YelpSearchService", type: :model do
    it "should return data for the businesses in the area" do
      VCR.use_cassette("yelp_service_location") do
      yelp = YelpSearchService.new

      expect(yelp.api_call).to be_kind_of(Yelp::Response::Search)
    end
  end
end
