$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'covert'

Covert.configure do |config|
  config.cipher_key = 'blah!'
  config.hmac_key = 'blah!'
end

require 'minitest/autorun'
