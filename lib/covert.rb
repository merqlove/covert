require 'openssl'
require 'base64'
require 'covert/version'

#
# Covert - makes your string securely obfuscated.
#
module Covert
  class Error < StandardError; end

  autoload :Config, 'covert/config.rb'
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
