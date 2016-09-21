class UsersController < ApplicationController
  before_action :verify_logged_in, only: [:show]

  def show
  end
end
