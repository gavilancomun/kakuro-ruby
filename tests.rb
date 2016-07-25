
require_relative "kakuro"
require "test/unit"

def println (*args)
  print *args
  puts
end

def cellEquals(c1, c2)
  c1.equals(c2)
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
    assert_equal(6, diff.length)
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

class TestTakeWhile < Test::Unit::TestCase
  def test_takewhile
  result = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].take_while {|n| n < 4}
  println result
  assert_equal(4, result.length)
  end
end

class TestConcat < Test::Unit::TestCase
  def test_concat
  a = [1, 2, 3]
  b = [4, 5, 6, 1, 2, 3]
  result = concatLists(a, b)
  println result 
  assert_equal(9, result.length)
  end
end

class TestDrop < Test::Unit::TestCase
  def test_drop
  a = [1, 2, 3, 4, 5, 6]
  result = a.drop(4)
  println result
  assert_equal(2, result.length)
  end
end

class TestTake < Test::Unit::TestCase
  def test_take
  a = [1, 2, 3, 4, 5, 6]
  result = a.take(4)
  println result
  assert_equal(4, result.length)
  end
end

class TestPartBy < Test::Unit::TestCase
  def test_partby
  data = [1, 2, 2, 2, 3, 4, 5, 5, 6, 7, 7, 8, 9]
  result = partitionBy(->(n) {0 == (n % 2)}, data)
  println result
  assert_equal(9, result.length)
  end
end

class TestPartAll < Test::Unit::TestCase
  def test_partall
  data = [1, 2, 2, 2, 3, 4, 5, 5, 6, 7, 7, 8, 9]
  result = partitionAll(5, 3, data)
  println result
  assert_equal(5, result.length)
  end
end

class TestPartN < Test::Unit::TestCase
  def test_partn
  data = [1, 2, 2, 2, 3, 4, 5, 5, 6, 7, 7, 8, 9]
  result = partitionN(5, data)
  println result
  assert_equal(3, result.length)
  end
end

class TestSolveStep < Test::Unit::TestCase
def test_solvestep
  result = solveStep([v(1, 2), v()], 5)
  print "solve step result "
  println result
  assert(cellEquals(v(1, 2), result[0]))
  assert(cellEquals(v(3, 4), result[1]))
end
end

class TestGatherValues < Test::Unit::TestCase
def test_gather
  line = [da(3, 4), v(), v(), d(4), e(), a(4), v(), v()]
  result = gatherValues(line)
  print "gather "
  println result
  assert_equal(4, result.length)
  assert(cellEquals(da(3, 4), result[0][0]))
  assert(cellEquals(d(4), result[2][0]))
  assert(cellEquals(e(), result[2][1]))
  assert(cellEquals(a(4), result[2][2]))
end
end

class TestPairTargets < Test::Unit::TestCase
def test_pairtargets
  line = [da(3, 4), v(), v(), d(4), e(), a(4), v(), v()]
  result = pairTargetsWithValues(line)
  print "pair "
  println result
  assert_equal(2, result.length)
  assert(cellEquals(da(3, 4), result[0][0][0]))
  assert(cellEquals(d(4), result[1][0][0]))
  assert(cellEquals(e(), result[1][0][1]))
  assert(cellEquals(a(4), result[1][0][2]))
end
end

class TestSolvePair < Test::Unit::TestCase
def test_solvepair
  line = [da(3, 4), v(), v(), d(4), e(), a(4), v(), v()]
  pairs = pairTargetsWithValues(line)
  pair = pairs[0]
  result = solvePair(->(cell) { cell.down }, pair)
  print "solvePair "
  println result
  assert_equal(3, result.length)
  assert(cellEquals(v(1, 2), result[1]))
  assert(cellEquals(v(1, 2), result[2]))
end
end

class TestSolveLine < Test::Unit::TestCase
def test_solveline
  line = [da(3, 4), v(), v(), d(4), e(), a(5), v(), v()]
  result = solveLine(line, ->(x) { x.across })
  print "solve line "
  println result
  assert_equal(8, result.length)
  assert(cellEquals(v(1, 3), result[1]))
  assert(cellEquals(v(1, 3), result[2]))
  assert(cellEquals(v(1, 2, 3, 4), result[6]))
  assert(cellEquals(v(1, 2, 3, 4), result[7]))
end
end

class TestLine < Test::Unit::TestCase
  def test_row
  result = solveRow([a(3), v(1, 2, 3), v(1)])
  print "solve row "
  println result
  assert(cellEquals(v(2), result[1]))
  assert(cellEquals(v(1), result[2]))
  end

  def test_col
  result = solveColumn([da(3, 12), v(1, 2, 3), v(1)])
  print "solve col "
  println result
  assert(cellEquals(v(2), result[1]))
  assert(cellEquals(v(1), result[2]))
  end
end

class TestGrid < Test::Unit::TestCase
  def test_grid
  grid1 = [
    [e(), d(4), d(22), e(), d(16), d(3)],
    [a(3), v(), v(), da(16, 6), v(), v()],
    [a(18), v(), v(), v(), v(), v()],
    [e(), da(17, 23), v(), v(), v(), d(14)],
    [a(9), v(), v(), a(6), v(), v()],
    [a(15), v(), v(), a(12), v(), v()]]
  result = solver(grid1)
  assert_equal("   --\\ 3       1         2       16\\ 6       4         2    \n", drawRow(result[1]))
  assert_equal("   --\\18       3         5         7         2         1    \n", drawRow(result[2]))
  assert_equal("   -----     17\\23       8         9         6       14\\--  \n", drawRow(result[3]))
  assert_equal("   --\\ 9       8         1       --\\ 6       1         5    \n", drawRow(result[4]))
  assert_equal("   --\\15       9         6       --\\12       3         9    \n", drawRow(result[5]))
  end
end

