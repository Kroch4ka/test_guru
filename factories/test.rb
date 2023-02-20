# frozen_string_literal: true
FactoryBot.define do
  factory :test do
    title { 'Кухни всего мира' }
    category
    creator { association :admin }
  end
end
