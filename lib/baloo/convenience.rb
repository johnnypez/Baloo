module Baloo
  module Convenience

    # get an app access token
    def client_credentials(id = Baloo.app_id, secret = Baloo.app_secret)
      @stored_client_credentials ||= {}
      unless @stored_client_credentials[id]
        params = {
        :client_id => id,
        :client_secret => secret,
        :grant_type => 'client_credentials'
        }
        @stored_client_credentials[id] = get('oauth/access_token', :query => params).split("=")[1]
      end

      @stored_client_credentials[id]
    end
    alias :app_token :client_credentials

  end
end