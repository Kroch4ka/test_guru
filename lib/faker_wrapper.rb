# frozen_string_literal: true

module FakerWrapper
  def self.email
    Faker::Config.locale = 'en'
    result = "#{Faker::Name.unique.first_name.downcase}@yandex.ru"
    Faker::Config.locale = 'ru'
    result
  end
end