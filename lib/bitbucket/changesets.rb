class Bitbucket::Changesets < Bitbucket::Base
  def changesets username, reponame, headname = 'master', limit = 15
    data = {start: headname, limit: limit}
    self.get("/api/1.0/repositories/#{username}"+
             "/#{reponame}/changesets", data)
  end
end
