require 'singleton'
require 'oauth'

class Bitbucket::Configuration
  include Singleton

  @@oauth_options =  {:signature_method=>"HMAC-SHA1",
    :request_token_path=>"/api/1.0/oauth/request_token",
    :authorize_path=>"/api/1.0/oauth/authenticate",
    :access_token_path=>"/api/1.0/oauth/access_token",
    :proxy=>nil,
    # :proxy=>"http://localhost:8080/",
    :scheme=>:header,
    :http_method=>:post,
    :oauth_version=>"1.0",
    :site=>"https://bitbucket.org"}

  def self.oauth_options
    @@oauth_options
  end

  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new(
      self.consumer_key,
      self.consumer_secret,
      @@oauth_options
    )
  end

  attr_accessor :consumer_key, :consumer_secret, :token, :secret, :username, :password
end
