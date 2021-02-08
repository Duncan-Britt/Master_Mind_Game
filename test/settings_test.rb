require 'minitest/autorun'
require_relative '../lib/advanced_options.rb'
require_relative '../lib/main.rb'

class SettingTest < Minitest::Test
  def test_code_length_getter

    expected = 4
    assert_equal expected, Settings.new.code_length
  end

  def test_access_code_length

    expected = 4
    assert_equal expected, Main.setting.code_length
  end
end
