require 'faraday'
require 'json'

API_SEARCH_URL = "#{API_URL}domain-search?"

module Hunter
  class DomainSearch

    def initialize(domain, key)
      @domain = domain
      @key = key
    end

    def perform(options)
      response = call_api(options)
      Struct.new(*response.keys).new(*response.values)
    end

    private
    def call_api(options)
      url_params = ''
      url_params = options.reject {| key, value | value.nil? }.to_a.map{ |pair| pair.join('=') }.join('&') unless options.nil?
      url =
        URI.parse(URI.encode(
          "#{API_SEARCH_URL}#{url_params}&domain=#{@domain}&api_key=#{@key}")
        )
      response = Faraday.new(url).get
      if response.success?
        JSON.parse(response.body, {symbolize_names: true})[:data].merge!(status: "success")
      else
        {status: 'error'}
      end
    end
  end
end
