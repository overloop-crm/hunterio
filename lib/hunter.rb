require File.expand_path(File.join(File.dirname(__FILE__), 'hunter/api'))
require File.expand_path(File.join(File.dirname(__FILE__), 'hunter/version'))

module Hunter
  extend self

  def new(key)
    Api.new(key)
  end
end
