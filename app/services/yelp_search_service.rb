class YelpSearchService

  def search_location
    params = { term: 'food', limit: 10}
    coordinates = { latitude: 39.7511873, longitude: -105.0031571 }
    Yelp.client.search_by_coordinates(coordinates, params)
  end
end
