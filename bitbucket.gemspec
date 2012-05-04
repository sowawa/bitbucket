Gem::Specification.new do |s|
  s.name        = 'bitbucket'
  s.version     = '0.0.1'
  s.date        = '2012-05-04'
  s.summary     = "Bitbucket"
  s.description = "using Bitbucket api via OAuth access token."
  s.authors     = ["sowawa (Keisuke SOGAWA)"]
  s.email       = 'keisuke.sogawa+gems@gmail.com'
  s.files       = [
    "lib/bitbucket.rb",
    "lib/bitbucket/base.rb",
    "lib/bitbucket/configuration.rb",
    "lib/bitbucket/user.rb",
    "lib/bitbucket/repository.rb",
    "lib/bitbucket/changesets.rb",
  ]
  s.homepage    =
    'http://rubygems.org/gems/bitbucket'
end
