module OAuthHelper
  class FiveHundredPxAdaptor
    def initialize(user)
      @consumer = build_consumer

      if user
        @identity = OAuth::AccessToken.new(@consumer,
                                           user.oauth_token, user.oauth_secret)
      end
    end

    def get_top_100
      path = '/v1/photos.json?feature=popular&rpp=100'
      if @identity
        response = @identity.get(path)
      else
        response = @consumer.request('get', path)
      end
      MultiJson.decode(response.body)['photos']
    end

    def get_photo(id)
      return {
        'name'=> 'A picture',
        'description'=> "It's pretty",
        'image_url'=> 'http://fillmurray.com/600/400'
      }
    end

    def get_user_access_token(credentials)
      auth_hash = {
        x_auth_mode: 'client_auth',
        x_auth_username: credentials[:username],
        x_auth_password: credentials[:password]
      }

      request_token = @consumer.get_request_token()
      @consumer.get_access_token(request_token, {}, auth_hash)
    end

    private
      BASE_URL = 'https://api.500px.com'
      CONSUMER_KEY = 'qAONVEkKAQlbJBnyXXRmJdRN85QCfxxQlJQOjNzQ'
      CONSUMER_SECRET = 'bwdE2F4GiGwVHDrccstzdq4CPsi6q91OSdhrGcMs'

      def build_consumer
        site_hash = {
          site: BASE_URL,
          request_token_path: "/v1/oauth/request_token",
          access_token_path: "/v1/oauth/access_token",
          authorize_path: "/v1/oauth/authorize"
        }

        OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, site_hash)
      end
  end
end
