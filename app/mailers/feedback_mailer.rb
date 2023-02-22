class FeedbackMailer < ApplicationMailer
  default to: ->{ Admin.pluck(:email) },
          from: 'feedback@example.com'

  def feedback
    @email = params[:email]
    @content = params[:content]
    mail(subject: 'Обратная связь')
  end
end
