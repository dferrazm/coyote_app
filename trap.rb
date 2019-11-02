class Trap
  def initialize(*items)
    @items = items
  end

  def to_s
    "Trap set up with #{@items.join ', '}."
  end
end
