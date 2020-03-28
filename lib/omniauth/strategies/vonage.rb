require 'omniauth-oauth2'
require 'jwt'

module OmniAuth
  module Strategies
    class Vonage < OmniAuth::Strategies::OAuth2

      option :name, 'google_oauth2'

      option :authorize_options, [
        :scope,
        :schema,
        :state,
        :prompt,
        :redirect_uri
      ]
      
      option :client_options, {
        :site          => 'https://login.auth.vonage.com/oauth2',
        :authorize_url => '/authorize',
        :token_url     => '/token'
      }

      uid { raw_info['sub'] }

      info do
        {
          :name:       => raw_info['sub'].split('@')[0]
        }
      end

      extra do
        'raw_info' => raw_info
      end

      def raw_info
        @raw_info ||= access_token.get('/userinfo').parsed
      end

    end

    class VonageLegacy < < OmniAuth::Strategies::Vonage
      default_options[:client_options][:site] = 'https://api.vonage.com'
    end

    class Vgip < < OmniAuth::Strategies::Vonage
      default_options[:client_options][:site] = 'https://api.gunify.vonage.com/extensions/v2/auth'
    end

    class VonageQa7 < OmniAuth::Strategies::Vonage
      default_options[:client_options][:site] = 'https://keymanager.entva0.qa.vonagenetworks.net/oauth2'
    end
  end
end