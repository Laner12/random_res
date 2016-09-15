require 'rails_helper'

RSpec.describe "YelpSearchService", type: :model do
    it "should return data for the businesses in the area" do
      VCR.use_cassette("yelp_service_location") do
      search = YelpSearchService.new.search_location

      expect(search).to be_kind_of(Yelp::Response::Search)
    end
  end
end
