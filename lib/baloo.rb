require "active_support/core_ext"
require "httparty"

require "baloo/error"
require "baloo/parser"
require "baloo/client"
require "baloo/version"
require "baloo/convenience"
require "baloo/batch_request"

module Baloo

  class << self

    attr_accessor :app_id
    attr_accessor :app_secret
    attr_accessor :app_namespace

    include Convenience

    def configure(options = {})
      options.stringify_keys!
      %w(app_id app_secret app_namespace).each {|opt| send("#{opt}=", options[opt])}
    end

    %w(get post put delete head).each do |http_method|
      define_method "#{http_method}" do |*args|
        slasherize args
        response = Client.send(http_method, *args)
        if block_given?
          yield response.parsed_response
        else
          response.parsed_response
        end
      end
    end
    
    private

    # ensure path starts with a forwardslash
    def slasherize(args)
      if args.first && args.first.is_a?(String)
        args[0] = ("/" << args.first) unless args.first =~ /^\//
      end

      args
    end

  end
end
