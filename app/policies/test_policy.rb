# frozen_string_literal: true

class TestPolicy < ApplicationPolicy
  def show?
    user.is_a?(Admin)
  end
end
