require 'rails_helper'

RSpec.describe "YelpSearchService", type: :model do
    it "should return data for the businesses in the area" do
      VCR.use_cassette("yelp_service_location") do
      yelp_response = YelpSearchService.new

      expect(yelp_response.api_call("39.8027644,-105.08748419999999")).to be_success
    end
  end
end
