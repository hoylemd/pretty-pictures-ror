module OAuthHelper
  def build_api(token, secret)
    # provide user's access token and secret, receive api object
    # (spoiler: the api object is just an oauth access token object)
    OAuth::AccessToken.new(oauth_consumer, token, secret)
  end

  def get_access_token_from_username_and_password(credentials)
    consumer = oauth_consumer

    auth_hash = {
      x_auth_mode: 'client_auth',
      x_auth_username: credentials[:username],
      x_auth_password: credentials[:password]
    }

    request_token = consumer.get_request_token()
    consumer.get_access_token(request_token, {}, auth_hash)
  end

  private
    BASE_URL = 'https://api.500px.com'
    CONSUMER_KEY = 'qAONVEkKAQlbJBnyXXRmJdRN85QCfxxQlJQOjNzQ'
    CONSUMER_SECRET = 'bwdE2F4GiGwVHDrccstzdq4CPsi6q91OSdhrGcMs'

    def oauth_consumer
      site_hash = {
        site: BASE_URL,
        request_token_path: "/v1/oauth/request_token",
        access_token_path: "/v1/oauth/access_token",
        authorize_path: "/v1/oauth/authorize"
      }

      OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, site_hash)
    end
end
