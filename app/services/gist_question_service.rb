class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GIST_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def get_gist_url
    @client.last_response.data.html_url
  end

  def success?
    @client.last_response&.status == 201
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
