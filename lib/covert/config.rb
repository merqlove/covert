# frozen_string_literal: true

module Covert
  #
  # Covert configuration
  #
  class Config
    attr_accessor :cipher_key, :cipher

    def initialize
      @cipher_key = nil
      @cipher = 'AES-256-CBC'
    end
  end
end
