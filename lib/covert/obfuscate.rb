# frozen_string_literal: true

module Covert
  #
  # Obfuscation class
  #
  class Obfuscate < Obfuscation
    def call
      c = cipher.encrypt
      c.key = digest
      encode(c.update(value.to_s) + c.final)
    end
  end
end
