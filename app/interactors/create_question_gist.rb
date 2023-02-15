class CreateQuestionGist
  include Interactor

  def call
    github_client = context.client || Octokit::Client
    question = context.question
    client = github_client.new(access_token: ENV['GIST_TOKEN'])
    context.gist = client.create_gist(gist_params(question))
  rescue Octokit::BadRequest
    context.fail!(error: I18n.t('interactors.create_question_gist.errors.bad_request'))
  rescue Octokit::TooManyRequests
    context.fail!(error: I18n.t('interactors.create_question_gist.errors.too_many_requests'))
  rescue
    context.fail!(error: I18n.t('interactors.create_question_gist.errors.something_went_wrong'))
  end

  def gist_params(question)
    {
      description: "",
      public: true,
      files: {
        "#{question.body}.txt" => {
          content: stringify_answers(question.answers)
        }
      }
    }
  end

  def stringify_answers(answers)
    answers.map.with_index { |answer, idx| "#{idx + 1})#{answer.body}" }.join("\n")
  end
end
