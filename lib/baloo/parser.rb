require 'yajl'
module Baloo
  class Parser < HTTParty::Parser

    def parse
      if /^true|false$/.match(body)
        bool
      elsif /^\{|\[.+\}|\]$/.match(body)
        json
      else
        body
      end
    end

    def json
      Yajl::Parser.parse(body)
    end

    def bool
      body =~ /^true$/ ? true : false
    end
  end
end