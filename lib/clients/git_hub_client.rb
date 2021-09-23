class GitHubClient

  def initialize
    @octokit_client = Octokit::Client.new(:access_token => ENV['GIST_TOKEN'])
  end

  def octokit_client
    @octokit_client
  end

  def create_gist(params)
    @octokit_client.create_gist(params)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
