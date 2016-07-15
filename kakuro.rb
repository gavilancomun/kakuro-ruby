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
    if (undefined == obj.down)
      return false
    end
    return (@down == obj.down) && (@across == obj.across)
  end

  def draw
    "   " + pad2(@down) + "\\" + pad2(@across) + "  "
  end
end

class ValueCell
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def draw
    if (1 == @values.length)
      "     " + @values[0] + "    "
    else {
      " " + (1..9)
        .map {|n| @values.includes?(n) ? "" + n : "."}
        .join("")
    end
  end

end

def da(down, across)
  DownAcrossCell.new(down, across)
end

def v (*arguments)
  if (0 == arguments.length)
    return new ValueCell.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  else
    return new ValueCell.new(arguments)
  end
end

