module Baloo
  class Client
    include HTTParty

    base_uri "https://graph.facebook.com"
    parser Parser
    format :plain

    private
    # overrides HTTParty#perform_request to handle exceptions and http errors
    def self.perform_request(http_method, path, options, &block) #:nodoc:
      response = super
      case response.response
        when Net::HTTPSuccess
          response
        when Net::HTTPClientError, Net::HTTPServerError
          raise HTTPError.new(response)
        else
          # unknown http error, raise it
          response.response.error!
      end

      rescue Net::ProtocolError, Timeout::Error, Errno::ETIMEDOUT, Errno::ECONNRESET
        raise NetworkError.new
    end
  end
end