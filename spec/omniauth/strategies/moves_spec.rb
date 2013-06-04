require 'spec_helper'

describe OmniAuth::Strategies::Moves do
  subject do
    OmniAuth::Strategies::Moves.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://api.moves-app.com/')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('/oauth/v1/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('/oauth/v1/access_token')
    end
  end
end
