require 'test_helper'

class CovertTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Covert::VERSION
  end

  def test_hmac
    assert_equal Covert.hmac('hmac'), '13ca4d5b9cdc1485834a05d926913d919d3c83de29c99314a7dbccafdc8be8ac'
  end

  def test_obfuscate
    assert_equal Covert.obfuscate('mystring'), '7hSfzDwp2JXZcieFpGCndA=='
  end

  def test_unobfuscate
    assert_equal Covert.unobfuscate('7hSfzDwp2JXZcieFpGCndA=='), 'mystring'
  end
end
