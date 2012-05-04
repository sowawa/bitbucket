require 'spec_helper'

describe Bitbucket::Repository do
  
  before do
    @repo = Bitbucket::Repository.new
  end
  
  it '#repositories' do
    stub_request(
      :get, "https://bitbucket.org/api/1.0/user/repositories/").
      to_return(mock_user_repositories)
    repos = @repo.repositories
    repos.first['scm'].should_not be_nil
  end
  
  it "#repository" do
    stub_request(
      :get, "https://bitbucket.org/api/1.0/repositories/sowasowa/rails-4.0/"
    ).to_return(
      status: 200,
      body: {
        'scm' =>   'git',
        'owner' => 'sowasowa',
        'is_private' => true,
        'name' => 'rails-4.0'
      }.to_json
    )
    repo = @repo.repository('sowasowa', 'rails-4.0')
    repo['name'].should match /^rails-4\.0$/
  end
  
  it "#create" do
    stub_request(
      :post, "https://bitbucket.org/api/1.0/repositories/"
    ).to_return(
      status: 200,
      body: {
        'scm' =>   'git',
        'owner' => 'sowasowa',
        'is_private' => true,
        'name' => 'hogehoge'
      }.to_json
    )
    repo = @repo.create('hogehoge')
    repo['name'].should match /^hogehoge$/
  end
  
  it "#destroy" do
    stub_request(
      :delete, "https://bitbucket.org/api/1.0/repositories/sowasowa/hogehoge/"
    ).to_return(
      status: 204,
      body: ''
    )
    repo = @repo.destroy('sowasowa','hogehoge')
  end
end
