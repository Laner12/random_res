class YelpSearchService

  def initialize
    @_connection = Faraday.new("https://api.yelp.com/v2/search")
  end

  def api_call
    connection.get do |request|
      request.params['term']                   = term_param
      request.params['ll']                     = coordinates_param
      request.params['oauth_consumer_key']     = consumer_key_param
      request.params['oauth_token']            = token_param
      request.params['oauth_signature_method'] = signature_method_param
      request.params['oauth_signature']        = signature_param
      request.params['oauth_timestamp']        = timestamp_param
      request.params['oauth_nonce']            = nonce_param
      request.params['oauth_version']          = version_param
    end
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
    SecureRandom.hex(timestamp_param)
  end

  def version_param
    1.0
  end

  def signature_param
    output = ENV['CONSUMER_SECRET'] + "&" + ENV['TOKEN_SECRET']
    base_string(output)
  end

  def base_string(string)
    escaped_string = CGI::escape("#{string}")
    sign('key', escaped_string)
  end

  def sign( key, base_string )
    digest = OpenSSL::Digest::Digest.new( 'sha1' )
    hmac = OpenSSL::HMAC.digest( digest, key, base_string  )
    Base64.encode64( hmac ).chomp.gsub( /\n/, '' )
  end

  private

  def connection
    @_connection
  end
end
