class YelpSearchService

  def initialize
    @_connection = Faraday.new("https://api.yelp.com/v2/search")
  end

  def api_call
    response = connection.get do |request|
      request.params['limit']                  = 5
      request.params['term']                   = "food"
      request.params['ll']                     = "39.7511873, -105.0031571"
      request.params['oauth_consumer_key']     = ENV['CONSUMER_KEY']
      request.params['oauth_token']            = ENV['TOKEN']
      request.params['oauth_signature_method'] = "HMAC-SHA1"
      request.params['oauth_signature']        = signature_param
      request.params['oauth_timestamp']        = Time.now.to_i
      request.params['oauth_nonce']            = nonce_param
      request.params['oauth_version']          = 1.0
    end
    binding.pry
    parse(response.body)
  end

  def term_param
    "food"
  end

  def coordinates_param
    "39.7511873, -105.0031571"
  end

  def consumer_key_param
    ENV['CONSUMER_KEY']
  end

  def token_param
    ENV['TOKEN']
  end

  def signature_method_param
    "HMAC-SHA1"
  end

  def timestamp_param
    Time.now.to_i
  end

  def nonce_param
      rand(10 ** 30).to_s.rjust(30,'0')
  end

  def version_param
    1.0
  end

  def signature_param
    output = ENV['CONSUMER_SECRET'] + "&" + ENV['TOKEN_SECRET']
    base_string(output)
  end

  def base_string(string)
    escaped_string = CGI::escape(string)
    sign('key', escaped_string)
  end

  def sign( key, base_string )
    digest = OpenSSL::Digest.new( 'sha1' )
    hmac = OpenSSL::HMAC.digest( digest, key, base_string  )
    output = Base64.encode64( hmac ).chomp.gsub( /\n/, '' )
    binding.pry
  end

  private

  def connection
    @_connection
  end

  def parse(response)
    JSON.parse(response)
  end
end

# "Invalid signature. Expected signature base string: GET&https%3A%2F%2Fapi.yelp.com%2Fv2%2Fsearch&limit%3D5%26ll%3D39.7511873%252C%2520-105.0031571%26oauth_consumer_key%3DGDuUHYsncVCRnXKpBt8GIw%26oauth_nonce%3D132720049625438087379340593444%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1474006901%26oauth_token%3DmYPgAKSCXqg8QndgmT13ckuzi7ubTXlo%26oauth_version%3D1.0%26term%3Dfood"
