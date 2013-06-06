require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Moves < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'activity location'

      option :client_options, {
        :site => 'https://api.moves-app.com/',
        :authorize_url => '/oauth/v1/authorize',
        :token_url => '/oauth/v1/access_token'
      }
      
      uid { raw_info['userId'] }
      info do { :firstDate => (raw_info['profile'] || {})['firstDate'] } end
      extra do { :raw_info => raw_info } end

      def request_phase
        options[:authorize_params] = client_params.merge(options[:authorize_params])
        super
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(super, client_params.merge({:grant_type => 'authorization_code'}))
      end
      
      def raw_info
        @raw_info ||= access_token.get('https://api.moves-app.com/api/v1/user/profile').parsed
      end
      
      private
      
      def client_params
        {:client_id => options[:client_id], :redirect_uri => callback_url ,:response_type => "code", :scope => DEFAULT_SCOPE}
      end
    end
  end
end
