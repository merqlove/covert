# frozen_string_literal: true

module Covert
  class Hmac
    class << self
      def call(value:)
        new(value).call
      end
    end

    def initialize(value)
      @value = value
    end

    def call
      OpenSSL::HMAC.hexdigest(digest, key, value)
    end

    private

    attr_reader :value

    def key
      Covert.config.hmac_key
    end

    def digest
      Covert.config.hmac_digest
    end
  end
end
