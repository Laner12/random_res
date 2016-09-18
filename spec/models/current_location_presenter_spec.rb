require 'rails_helper'

RSpec.describe "LocationPresenter" do
  it "Calls the service for location and formats the response" do
    presenter = LocationPresenter.new

    expect(presenter.format_coordinates).to be_kind_of(String)
  end
end
