class CurrentLocationService

  def initialize
    @_connection = Faraday.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")
    # can probably refactor the call above using key: ENV vs "key" => ENV
  end

  def get_location
    response = connection
    parse(response.body)['location']
  end

  private

  def parse(response)
    JSON.parse(response)
  end

  def connection
    @_connection
  end
end
