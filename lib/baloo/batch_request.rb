require 'yajl'
module Baloo
  class BatchRequest

    Limit = 20
    
    attr_accessor :requests, :responses

    def initialize
      @requests = []
      @responses = []
    end

    def add(method, path, body = {})
      request = { :method => method, :relative_url => path }
      unless body.empty?
        request[:body] = HTTParty::HashConversions.to_params(body)
      end
      @requests << request
    end

    # peform the batch request
    # the passed block will recieve each response as it is parsed
    def perform(&block)
      raise Exception.new("You must have at least 2 requests") unless @requests.length > 1
      @responses.clear
      requests.each_slice(Limit).to_a.each do |batch|
        body = {
          :batch => Yajl::Encoder.encode(batch),
          :access_token => Baloo.client_credentials
        }
        Client.post("/", :body => body).each do |response|
          # response['headers'] = Yajl::Parser.parse(response['headers'])
          response['body'] = Yajl::Parser.parse(response['body'])
          yield response
        end
      end
    end

  end
end