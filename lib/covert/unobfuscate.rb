# frozen_string_literal: true

module Covert
  #
  # Unobfuscation class
  #
  class Unobfuscate < Obfuscation
    def call
      c = cipher.decrypt
      c.key = digest
      c.update(decode(value.to_s)) + c.final
    end
  end
end
