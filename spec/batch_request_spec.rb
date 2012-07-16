require 'spec_helper'

describe Baloo::BatchRequest do

  it "should bloody well work!" do
    Baloo.configure :app_id => "204876786306406", :app_secret => "34dc50cea8b8bbdf1dba1018c9aebc90", :app_namespace => "baloo_test"

    batch = Baloo::BatchRequest.new
    batch.add :get, '582470824'
    batch.add :post, '582470824/albums', :name => "Foo Album"
    25.times { batch.add :get, 'betapond' }

    responses = []
    batch.perform do |response|
      responses << response
      response['code'].class.should eq Fixnum
    end
    
    responses.count.should eq 27
    responses[0]['body'].class.should eq Hash
    responses[0]['headers'].class.should eq Array

    responses[0]['body']['username'].should eq 'johnnypez'
    responses[1]['code'].should eq 400 # no access token was give so Bad Request is expected
    responses[3]['code'].should eq 200
  end

end