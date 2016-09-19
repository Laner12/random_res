class LocationPresenter

  def initialize
    @current_location = CurrentLocationService.new.get_location
  end

  def format_coordinates
    collection = @current_location.values
    "#{collection[0]},#{collection[1]}"
  end
end
