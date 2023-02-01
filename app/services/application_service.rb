# frozen_string_literal: true

class ApplicationService
  def self.call(params, &block)
    new(params, &block).call
  end
end
