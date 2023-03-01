class UserMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          from: 'test-guru@example.com'

  def feedback
    @email = params[:email]
    @content = params[:content]
    mail(subject: t('.subject'))
  end
end