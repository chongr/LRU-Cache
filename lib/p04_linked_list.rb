class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @first, @last = nil, nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @first
  end

  def last
    @last
  end

  def empty?
    @first.nil?
  end

  def get(key)
    return nil if empty?

    link = first

    until link.nil?
      return link.val if link.key == key
      link = link.next
    end

    nil
  end

  def include?(key)

    return false if empty?

    each do |link|
      return true if link.key == key
    end

    false

  end

  def insert(key, val)

    new_node = Link.new(key, val)

    if empty?
      (@last, @first = new_node, new_node)
    else
      @first.prev, new_node.next = new_node, @first
      @first = new_node
    end
  end

  def remove(key)

    return nil if empty?

    each do |node|
      if node.key == key
        prev_node = node.prev
        next_node = node.next
        if next_node.nil? && prev_node.nil?
          @first = nil
          @last = nil
        elsif next_node.nil?
          prev_node.next = nil
          @last = prev_node
        elsif prev_node.nil?
          next_node.prev = nil
          @first = next_node
        else
          prev_node.next = next_node
          next_node.prev = prev_node
        end
        return true
      end
    end
    nil
  end

  def each(&prc)
    node = @first
    until node == nil
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
