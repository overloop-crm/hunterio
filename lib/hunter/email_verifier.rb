require 'faraday'
require 'json'

API_VERIFY_URL = "#{API_URL}email-verifier?"

module Hunter
  class EmailVerifier

    def initialize(email, key)
      @email = email
      @key = key
    end

    def perform
      response = call_api
      Struct.new(*response.keys).new(*response.values) unless response.empty?
    end

    private

    def call_api
      url = URI.parse(URI.encode("#{API_VERIFY_URL}email=#{@email}&api_key=#{@key}"))
      response = Faraday.new(url).get
      if response.success?
        JSON.parse(response.body, {symbolize_names: true})[:data].merge!(status: "success")
      else
        {status: 'error'}
      end
    end
  end
end
