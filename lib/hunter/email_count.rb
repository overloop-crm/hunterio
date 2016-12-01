require 'faraday'
require 'json'

API_COUNT_URL = "#{API_URL}email-count?"

module Hunter
  class EmailCount

    def initialize(domain)
      @domain = domain
    end

    def perform
      response = call_api
      Struct.new(*response.keys).new(*response.values) unless response.empty?
    end

    private

    def call_api
      url = URI.parse(URI.encode("#{API_COUNT_URL}domain=#{@domain}"))
      response = Faraday.new(url).get
      if response.success?
        JSON.parse(response.body, {symbolize_names: true})[:data].merge!(status: "success")
      else
        {status: 'error'}
      end
    end
  end
end
