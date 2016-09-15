class CurrentLocationService

  def initialize
    @_connection = Faraday.new("https://www.googleapis.com/geolocation/v1/geolocate")
    # connection.params['key'] = ENV['GOOGLE_API_KEY']
  end

  def get_location
    response = connection.post(''), {'key' => ENV['GOOGLE_API_KEY']}
    binding.pry
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
