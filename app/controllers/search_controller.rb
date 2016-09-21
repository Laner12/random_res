class SearchController < ApplicationController
  before_action :verify_logged_in, only: [:index]
  
  def index
    @restaurants = Restaurant.all_by_location
  end
end
