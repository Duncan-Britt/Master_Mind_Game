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
    expected = "x x x x"
    a = CpuCodeMaker.new
    a.code=([1,1,1,1])
    assert_equal expected, a.get_clues([1,1,1,1])
  end

  def test_guess_check_2
    expected = "x o"
    a = CpuCodeMaker.new
    a.code=([1,3,5,1])
    assert_equal expected, a.get_clues([1,2,3,4])
  end

  def test_guess_check_3
    expected = "x o o"
    a = CpuCodeMaker.new
    a.code=([2,1,4,2])
    assert_equal expected, a.get_clues([2,2,2,4])
  end

  def test_guess_check_4
    expected = "x o o"
    a = CpuCodeMaker.new
    a.code=([2,2,2,4])
    assert_equal expected, a.get_clues([2,1,4,2])
  end
end

class HumanCodeMakerTest < Minitest::Test
  def test_cpu_guess_check
    expected = "x o"
    a = HumanCodeMaker.new
    a.code=([4,2,4,6])
    assert_equal expected, a.get_clues([2,1,4,2])
  end
end
