# frozen_string_literal: true

class Admin::AdminPolicy < ApplicationPolicy
  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user && user.admin?
    @user = user
    @record = record
  end
end
