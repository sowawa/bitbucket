class Bitbucket::Repository < Bitbucket::Base
  def repositories
    self.get('/api/1.0/user/repositories/')
  end

  def repository username, reponame
    self.get("/api/1.0/repositories/#{username}/#{reponame}/")
  end
  
  def create reponame, is_private = true, scm = 'git'
    data = {
      name: reponame,
      scm: scm,
      is_private: is_private ? 'True' : 'False',
    }
    self.post("/api/1.0/repositories/", data)
  end

  def destroy username, reponame 
    self.delete("/api/1.0/repositories/#{username}/#{reponame}/")
  end 
end
