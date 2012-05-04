require 'spec_helper'

describe Bitbucket::Changesets do
  
  before do
    @chset = Bitbucket::Changesets.new
  end
  
  it '#repositories' do
    stub_request(
      :get, "https://bitbucket.org/api/1.0/repositories/sowasowa/hogehoge/changesets?limit=15&start=master"
    ).to_return(
    status: 200,
    body: {
      count: 5.to_s,
      start: 'master',
      limit: 15.to_s, 
      changesets: [] 
    }.to_json)
    repos = @chset.changesets('sowasowa', 'hogehoge', 'master', 15)
    repos['start'].should match(/^master$/)
  end
end
