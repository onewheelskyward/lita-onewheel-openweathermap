require 'rest-client'

module Lita
  module Handlers
    class OnewheelOpenweathermap < Handler
      config :api_key

      route /^uv$/, :uv_index, command: true

      def uv_index(response)
        data = get_data

        response.reply "UV index in Portland, OR is #{data['data']} today."
      end

      def get_data
        uri = "http://api.openweathermap.org/v3/uvi/45.75,-122.75/2016-04-17Z.json?appid=#{config.api_key}"
        puts "getting #{uri}"
        data = RestClient.get uri
        JSON.parse data
      end

      Lita.register_handler(self)
    end
  end
end

