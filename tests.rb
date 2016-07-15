
require_relative "kakuro"
require "test/unit"

class TestDrawRow < Test::Unit::TestCase
 
  def test_DrawRow
    line = [da(3, 4), v(), v(1, 2), d(4), e(), a(5), v(4), v(1)]
    result = drawRow(line)
    print result
    assert_equal("    3\\ 4   123456789 12.......    4\\--     -----     --\\ 5       4         1    \n", result)
  end
 
end

class TestPermute < Test::Unit::TestCase
  def test_permute
    vs = [v(), v(), v()]
    results = permuteAll(vs, 6)
    print results
    assert_equal(10, results.length)
    diff = results.find_all {|p| allDifferent(p)}
    assert_equal(6, diff.length);
  end
end


