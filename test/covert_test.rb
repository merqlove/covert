require 'test_helper'

class CovertTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Covert::VERSION
  end

  def test_obfuscate
    assert_equal Covert.obfuscate('mystring'), '7hSfzDwp2JXZcieFpGCndA=='
  end

  def test_unobfuscate
    assert_equal Covert.unobfuscate('7hSfzDwp2JXZcieFpGCndA=='), 'mystring'
  end
end
