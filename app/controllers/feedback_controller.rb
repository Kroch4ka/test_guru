class FeedbackController < ApplicationController
  def show; end

  def create
    email = params[:email]
    content = params[:content]
    UserMailer.with(email: email, content: content).feedback.deliver_now
  end
end
