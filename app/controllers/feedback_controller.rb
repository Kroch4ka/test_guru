class FeedbackController < ApplicationController
  def create
    email = params[:email]
    content = params[:content]
    FeedbackMailer.with(email: email, content: content).feedback.deliver_now
  end
end