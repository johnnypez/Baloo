module Baloo
  
  class Error < StandardError
  end

  class HTTPError < Error
    attr_reader :response
    MessageFormat = "%s %s => %s \n %s"

    def initialize(response)
      @response = response
      super sprintf(MessageFormat, response.request.http_method, response.request.uri, response.response.class, response.body)
    end
  end

  class NetworkError < Error
    attr_reader :original

    def initialize(original = $!)
      if original.nil?
        super
      else
        super(original.message)
      end
      @original = original
    end
  end

end