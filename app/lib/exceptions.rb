# frozen_string_literal: true
# Exceptions for testing
module Exceptions

  # Error class
  class Error < StandardError
    attr_reader :data

    def initialize(message = '', data = {})
      super(message)
      @data = data
    end
  end

  class Unauthorized < Error
  end

  class Forbidden < Error
  end

  class NotFound < Error
  end

  class Conflict < Error
  end

  class BadRequest < Error
  end
end