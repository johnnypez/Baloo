require 'spec_helper'

describe Baloo do

  it "should allow configuration for a fb app" do
    Baloo.app_id.should be nil
    Baloo.app_secret.should be nil
    Baloo.app_namespace.should be nil

    Baloo.configure :app_id => 1, :app_secret => 2, :app_namespace => "test"

    Baloo.app_id.should eq 1
    Baloo.app_secret.should eq 2
    Baloo.app_namespace.should eq "test"
  end
  
  it "should allow starting forwardslash or not" do
    res = Baloo.get 'theo2'
    res.class.should eq Hash
    Baloo.get(res['id'])['id'].should eq res['id']
    Baloo.get('/theo2')['id'].should eq res['id']
  end

  it "should allow t/f in the response" do
    res = Baloo.get 'boylesports'
    res.class.should eq FalseClass
  end

  it "should handle errors like a boss!" do
    expect { Baloo.get 'me' }.to raise_error Baloo::HTTPError
  end

end