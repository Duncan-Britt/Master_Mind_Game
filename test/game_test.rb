require 'minitest/autorun'
require_relative '../lib/main.rb'

class CpuCodeMakerTest < Minitest::Test

  def test_number_generator_returns_array
    assert_kind_of Array, CpuCodeMaker.new.code
  end

  def test_game_code_length
    expected = 4
    assert_equal expected, CpuCodeMaker.new.code.length
  end

  def test_game_code_char_type
    CpuCodeMaker.new.code.each do |i|
      assert_kind_of Integer, i
    end
  end

  def test_multiple_codes
    first = CpuCodeMaker.new.code
    second = CpuCodeMaker.new.code
    test = first != second
    assert test, msg = "Multiple instances of CpuCodeMaker produced the same code. Make sure they are generating code independently"
  end

  def test_guess_check_returns_clues
    skip
    expected = "x x x x"
    assert_equal expected, CpuCodeMaker.new.guess_check([1,1,1,1])
  end
end