
require_relative "kakuro"
require "test/unit"

def println (*args)
  print *args
  puts
end

class TestDrawRow < Test::Unit::TestCase
 
  def test_DrawRow
    line = [da(3, 4), v(), v(1, 2), d(4), e(), a(5), v(4), v(1)]
    result = drawRow(line)
    println result
    assert_equal("    3\\ 4   123456789 12.......    4\\--     -----     --\\ 5       4         1    \n", result)
  end
 
end

class TestPermute < Test::Unit::TestCase
  def test_permute
    vs = [v(), v(), v()]
    results = permuteAll(vs, 6)
    println results
    assert_equal(10, results.length)
    diff = results.find_all {|p| allDifferent(p)}
    assert_equal(6, diff.length);
  end
end

class TestTranspose < Test::Unit::TestCase
  def test_transpose
    ints = [[1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4]]
    tr = transpose(ints)
    println ints
    println tr
    assert_equal(ints.length, tr[0].length)
    assert_equal(ints[0].length, tr.length)
  end
end


