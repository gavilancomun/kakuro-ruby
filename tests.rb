
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

