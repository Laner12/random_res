require 'rubygems'
require 'oauth'

class YelpSearchService

  def api_call(latitude_longitude)
    consumer = OAuth::Consumer.new( ENV['CONSUMER_KEY'],ENV['CONSUMER_SECRET'], {:site => "http://api.yelp.com", :signature_method => "HMAC-SHA1", :scheme => :query_string})
    access_token = OAuth::AccessToken.new( consumer, ENV['TOKEN'],ENV['TOKEN_SECRET'])
    response = access_token.get("/v2/search?ll=#{latitude_longitude}&limit=10")
    # get param could be method call to if statement of options? or passing the option along with the latitude_longitude
    parse(response.body)["businesses"]
  end

  private

  def parse(response)
    JSON.parse(response)
  end
end
