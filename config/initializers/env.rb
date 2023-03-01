# frozen_string_literal: true
envs = %w[development test]

if envs.include? Rails.env
  Dotenv.load
end