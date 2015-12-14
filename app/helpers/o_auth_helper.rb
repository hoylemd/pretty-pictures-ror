module OAuthHelper
  class FiveHundredPxAdaptor
    def initialize(user=nil)
      @consumer = build_consumer

      if user
        @identity = OAuth::AccessToken.new(@consumer,
                                           user.oauth_token, user.oauth_secret)
      end
    end

    def make_request(method, path)
      if @identity
        response = @identity.request(method, path)
      else
        response = @consumer.request(method, path)
      end
      MultiJson.decode(response.body)
    end

    def get_top_100
      path = '/v1/photos.json?feature=popular&rpp=100'
      make_request('get', path)['photos']
    end

    def get_photo(id)
      path = "/v1/photos/#{id}"
      make_request('get', path)['photo']
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
