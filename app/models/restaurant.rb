class Restaurant
  attr_reader :name,
              :rating_img_url_large,
              :review_count,
              :image_url,
              :url

  def initialize(raw_restaurant)
    @name                 = raw_restaurant[:name]
    @rating_img_url_large = raw_restaurant[:rating_img_url_large]
    @review_count         = raw_restaurant[:review_count]
    @image_url            = raw_restaurant[:image_url]
    @url                  = raw_restaurant[:url]
    @distance_in_meters   = raw_restaurant[:distance]
    @is_closed            = raw_restaurant[:is_closed]
  end

  def self.all_by_location
    location = LocationPresenter.new.format_coordinates
    YelpSearchService.new.api_call(location).map do |raw_restaurant|
      Restaurant.new(raw_restaurant)
    end
  end

  def distance
    (@distance_in_meters * 0.0062137).round(1)
  end

  def status
    if @is_closed
      "Currently Closed."
    else
      "Currently Open."
    end
  end
end
