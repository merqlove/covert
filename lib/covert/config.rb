# frozen_string_literal: true

module Covert
  #
  # Covert configuration
  #
  class Config
    attr_accessor :cipher_key, :cipher, :hmac_key, :hmac_digest

    def initialize
      @cipher_key = nil
      @cipher = 'AES-256-CBC'
      @hmac_key = nil
      @hmac_digest = 'SHA256'
    end
  end
end
