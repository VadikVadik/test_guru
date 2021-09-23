class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def client
    @client
  end

  def get_gist_url
    @client.octokit_client.last_response.data.html_url
  end

  def success?
    @client.octokit_client.last_response&.status == 201
  end

  private

  def gist_params
    {
      description: I18n.translate('services.gist_question_service.description', test: @test.title),
      public: true,
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
