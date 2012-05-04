require 'rspec'
require 'webmock/rspec'
require 'bitbucket'

Bitbucket.config.consumer_key = 'aaaaa'
Bitbucket.config.consumer_secret = 'bbbbb'
Bitbucket.config.token  = 'ccccc'
Bitbucket.config.secret = 'ddddd'

def mock_emails
  @mock_emails ||= open(File.expand_path(File.dirname(__FILE__) + '/mock/emails')).read
end

def mock_user_repositories
  @mock_emails ||= open(
    File.expand_path(File.dirname(__FILE__) + '/mock/user/repositories')
  ).read
end
