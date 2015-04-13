require "scalablepress/version"
require "scalablepress/api"
Dir[File.dirname(__FILE__) + '/scalablepress/resources/*.rb'].each {|file| require file }

module Scalablepress
  def self.API_KEY
    @API_KEY
  end

  def self.API_KEY=(key)
    @API_KEY=key
  end
end
