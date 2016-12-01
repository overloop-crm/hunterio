require 'faraday'
require 'json'

API_GENERATE_URL = "#{API_URL}email-finder?"

module Hunter
  class EmailFinder

    def initialize(first_name, last_name, key)
      @first_name = first_name
      @last_name = last_name
      @key = key
    end

    def perform(options)
      response = call_api(options)
      Struct.new(*response.keys).new(*response.values) unless response.empty?
    end

    private

    def call_api(options)
      url_params = options.to_a.map{ |pair| pair.join('=') }.join('&')
      url = URI.parse(URI.encode("#{API_GENERATE_URL}#{url_params}&first_name=#{@first_name}&last_name=#{@last_name}&api_key=#{@key}"))
      response = Faraday.new(url).get
      if response.success?
        JSON.parse(response.body, {symbolize_names: true})[:data].merge!(status: "success")
      else
        {status: 'error'}
      end
    end
  end
end
