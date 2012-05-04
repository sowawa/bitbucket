require 'oauth'
require 'json'

class Bitbucket::Base
  attr_reader :access_token 

  def initialize options = nil
    if options.nil?
      options = Bitbucket.default_auth_options
    end
    if options[:token] && options[:secret]
      @access_token = OAuth::AccessToken.new(
        Bitbucket.config.oauth_consumer,
        options[:token], options[:secret]
      )
    else
      # TODO for basic auth method...
      @usernaem = options[:username]
      @password = options[:password]
    end
    if @username.nil? && @access_token.nil?
      raise Error
    end
  end

  # 
  def get path, data = nil, raw = false
    if !data.nil? && data.is_a?(Hash)
      path = path + '?' +
        data.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')
    end
    res = @access_token.get(path)
    # value() raise Net::HTTPError
    res.value
    unless raw
      return JSON.parse(res.body)
    else
      return res.body
    end
  end

  def post path, data = nil, raw = false
    res = @access_token.post(path,data)
    # value() raise Net::HTTPError
    res.value
    unless raw
      return JSON.parse(res.body)
    else
      return res.body
    end
  end

  def delete path
    res = @access_token.delete(path)
    # value() raise Net::HTTPError
    res.value
    return res.body
  end

end
