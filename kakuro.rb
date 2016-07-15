# kakuro solver

class DownAcrossCell 
  attr_accessor :down
  attr_accessor :across

  def initialize(down, across)
    @down = down
    @across = across
  end

  def to_s
    "DownAcrossCell[" + @down + ", " + @across + "]"
  end

  def  equals(obj)
    if (this == obj)
      return true
    end
    if (obj == nil)
      return false
    end
    return (@down == obj.down) && (@across == obj.across)
  end

  def draw
    "   " + sprintf("%2d", @down) + "\\" + sprintf("%2d", @across) + "  "
  end
end

class AcrossCell 
  attr_accessor :across

  def initialize(across)
    @across = across
  end

  def to_s
    "AcrossCell[" + @across + "]"
  end

  def  equals(obj)
    if (this == obj)
      return true
    end
    if (obj == nil)
      return false
    end
    return (@across == obj.across)
  end

  def draw
    "   --\\" + sprintf("%2d", @across) + "  "
  end
end

class DownCell 
  attr_accessor :down

  def initialize(down)
    @down = down
  end

  def to_s
    "DownCell[" + @down + "]"
  end

  def  equals(obj)
    if (this == obj)
      return true
    end
    if (obj == nil)
      return false
    end
    return (@down == obj.down)
  end

  def draw
    "   " + sprintf("%2d", @down) + "\\--  "
  end
end

class ValueCell
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def draw
    if (1 == @values.length)
      "     " + @values[0].to_s + "    "
    else
      " " + (1..9).map {|n| (@values.include?(n) ? n.to_s : ".")}.join
    end
  end

end

class EmptyCell
  def draw
    "   -----  "
  end
end

def da(down, across)
  DownAcrossCell.new(down, across)
end

def d(down)
  DownCell.new(down)
end

def a(across)
  AcrossCell.new(across)
end

def e
  EmptyCell.new
end

def v (*arguments)
  if (0 == arguments.length)
    return ValueCell.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  else
    return ValueCell.new(arguments)
  end
end

def drawRow(row)
  row.map {|v| v.draw}.join + "\n";
end

