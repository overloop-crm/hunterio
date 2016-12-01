require 'uri'

API_URL = 'https://api.hunter.io/v2/'

require File.expand_path(File.join(File.dirname(__FILE__), 'domain_search'))
require File.expand_path(File.join(File.dirname(__FILE__), 'email_count'))
require File.expand_path(File.join(File.dirname(__FILE__), 'email_finder'))
require File.expand_path(File.join(File.dirname(__FILE__), 'email_verifier'))

module Hunter
  class Api
    attr_reader :key

  	def initialize(key)
  		@key = key
  	end

    def domain_search(domain, options = nil)
      Hunter::DomainSearch.new(domain, self.key).perform(options)
    end

    def email_count(domain)
      Hunter::EmailCount.new(domain).perform
    end

    def email_finder(first_name, last_name, options)
      Hunter::EmailFinder.new(first_name, last_name, self.key).perform(options.reject {| key, value | value.nil? })
    end

    def email_verifier(email)
      Hunter::EmailVerifier.new(email, self.key).perform
    end

  end
end
