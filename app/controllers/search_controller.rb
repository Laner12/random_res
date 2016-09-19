class SearchController < ApplicationController

  def index
    @restaurants = Restaurant.all_by_location
  end
end
