module Baloo
  module Convenience

    # get an app access token
    def client_credentials(id = Baloo.app_id, secret = Baloo.app_secret)
      unless @client_credentials
        params = {
        :client_id => id,
        :client_secret => secret,
        :grant_type => 'client_credentials'
        }
        puts "Transport..."
        @client_credentials = get('oauth/access_token', :query => params).split("=")[1]
      end

      @client_credentials
    end
    alias :app_token :client_credentials

  end
end