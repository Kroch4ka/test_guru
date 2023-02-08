# frozen_string_literal: true
class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'Вы не являетесь администратором!'
  end

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end
end
