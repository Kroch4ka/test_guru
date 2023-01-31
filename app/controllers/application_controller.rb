class ApplicationController < ActionController::Base
  before_action :set_user

  private

  def set_user
    @user = User.all.order(id: :asc).first
  end
end
