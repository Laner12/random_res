require 'rails_helper'

RSpec.describe "CurrentLocationService", type: :model do
    it "should return data for lat and lng" do
      VCR.use_cassette("current_location") do
      current_location = CurrentLocationService.new.get_location

      expect(current_location).to be_kind_of(Hash)
    end
  end
end
