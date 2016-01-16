class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count, :start, :end

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @start = 0
    @end = @start
  end

  def [](i)
    @store[(i + start) % capacity]
  end

  def []=(i, val)
    @store[(i + start )% capacity] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    i = 0

    while i <= count
      return true if @store[(i+start) % capacity] == val
      i += 1
    end

    false
  end

  def push(val)
    resize! if count == capacity - 1
    @store[@end % capacity] = val
    @end += 1
    @count += 1
  end

  def unshift(val)
  end

  def pop
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
