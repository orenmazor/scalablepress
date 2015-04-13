require 'rest-client'

module Scalablepress
    class API
      def self.get(path)
        JSON.parse(RestClient.get("https://#{Scalablepress::API_KEY}:@api.scalablepress.com/v2/#{path}"))
      end
    end
end
