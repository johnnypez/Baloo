require 'spec_helper'

describe Baloo::Convenience do
  
  it "should support retrieval of app access tokens" do
    Baloo.configure :app_id => "292746490801773", :app_secret => "3844c2d35efed1b60012ccdf4d3ccf6f", :app_namespace => "devtastic"
    Baloo.client_credentials.should match /^292746490801773\|.+/
  end

end