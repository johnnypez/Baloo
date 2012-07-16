require 'spec_helper'

describe Baloo::Convenience do
  
  it "should support retrieval of app access tokens" do
    Baloo.configure :app_id => "204876786306406", :app_secret => "34dc50cea8b8bbdf1dba1018c9aebc90", :app_namespace => "baloo_test"
    Baloo.client_credentials.should match(/^204876786306406\|.+/)
  end

end