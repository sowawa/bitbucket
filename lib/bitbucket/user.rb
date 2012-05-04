class Bitbucket::User < Bitbucket::Base
  def emails
    self.get('/api/1.0/emails/')
  end
end
