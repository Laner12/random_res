class UsersController < ApplicationController

  def show
    @restaurants = Restaurant.all_by_location
  end
end
