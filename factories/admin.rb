# frozen_string_literal: true
FactoryBot.define do
  factory :admin, class: "User" do
    type { "Admin" }
  end
end
