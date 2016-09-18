class CurrentLocationService

  def initialize
    @_connection = Faraday.post("https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")
  end

  def get_location
    response = connection
    parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)[:location]
  end

  def connection
    @_connection
  end
end
