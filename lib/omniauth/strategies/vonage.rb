require 'omniauth-oauth2'
require 'jwt'

module OmniAuth
  module Strategies
    class Vonage < OmniAuth::Strategies::OAuth2

      option :name, 'vonage'

      option :authorize_options, [
        :scope,
        :schema,
        :state,
        :prompt,
        :redirect_uri
      ]
      
      option :client_options, {
        :site          => 'https://login.auth.vonage.com',
        :authorize_url => '/oauth2/authorize',
        :token_url     => '/oauth2/token'
      }

      uid { raw_info['sub'] }

      info do
        {
          :name       => raw_info['sub'].split('@')[0]
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth2/userinfo').parsed
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def get_access_token(request)
        verifier = request.params['code']
        client_get_token(verifier, callback_url)
      end

      def client_get_token(verifier, redirect_uri)
        client.auth_code.get_token(verifier, get_token_options(redirect_uri), get_token_params)
      end

      def get_token_params
        deep_symbolize(options.auth_token_params || {})
      end

      def get_token_options(redirect_uri = '')
        { redirect_uri: redirect_uri }.merge(token_params.to_hash(symbolize_keys: true))
      end

    end
  end
end