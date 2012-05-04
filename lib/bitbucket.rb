module Bitbucket
  class Error < StandardError; end

  autoload :Configuration, 'bitbucket/configuration'
  autoload :Base,          'bitbucket/base'
  autoload :User,          'bitbucket/user'
  autoload :Repository,    'bitbucket/repository'
  autoload :Changesets,    'bitbucket/changesets'

  def config
    Bitbucket::Configuration.instance
  end
  
  def default_auth_options
    if self.config.token.nil?
      return {username: self.config.username, password: self.config.password}
    else
      return {token: self.config.token, secret: self.config.secret}
    end
  end

  module_function :config, :default_auth_options
end
