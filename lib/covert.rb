require 'openssl'
require 'base64'
require 'covert/version'

#
# Covert - makes your string securely obfuscated.
#
module Covert
  class Error < StandardError; end

  autoload :Config, 'covert/config.rb'
  autoload :Hmac, 'covert/hmac.rb'
  autoload :Obfuscation, 'covert/obfuscation.rb'
  autoload :Obfuscate, 'covert/obfuscate.rb'
  autoload :Unobfuscate, 'covert/unobfuscate.rb'

  class << self
    attr_writer :config

    # @return [Config]
    def config
      @config ||= Config.new
    end

    # @return [Config]
    def reset
      @config = Config.new
    end

    def configure
      yield(config)
    end
  end

  # @param [String] str String for HMAC encoding
  # @example Generate HMAC code
  #   Covert.hmac("mystring") #=> "cddb0db23f469c8bf072b21fd837149bd6ace9ab771cceef14c9e517cc93282e"
  # @return [String] HMAC encoded string
  def self.hmac(str)
    Hmac.call(value: str)
  end

  # @param [String] str String to obfuscate
  # @example Obfuscate a String
  #   Covert.obfuscate("mystring") #=> "7hSfzDwp2JXZcieFpGCndA=="
  # @return [String] Obfuscated string
  def self.obfuscate(str)
    Obfuscate.call(value: str)
  end

  # @param [String] str Obfuscated string
  # @example Unobfuscate a String
  #   Covert.unobfuscate("7hSfzDwp2JXZcieFpGCndA==") #=> "mystring"
  # @return [String] Unobfuscated string
  def self.unobfuscate(str)
    Unobfuscate.call(value: str)
  end
end
