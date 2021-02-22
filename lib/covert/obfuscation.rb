# frozen_string_literal: true

module Covert
  class Obfuscation
    class << self
      def call(value:)
        new(value).call
      end
    end

    def initialize(value)
      @value = value
    end

    private

    attr_reader :value

    def cipher
      OpenSSL::Cipher.new(Covert.config.cipher)
    end

    def cipher_key
      Covert.config.cipher_key
    end

    def digest
      Digest::SHA256.digest(cipher_key)
    end

    def decode(value)
      Base64.strict_decode64(value)
    end

    def encode(value)
      Base64.strict_encode64(value)
    end
  end
end
